require 'sinatra'
require 'sinatra/param'
require 'sinatra/reloader'
require 'json'
require 'rack/parser'
require 'sinatra/json'
require './config/boot'
require 'active_record'
require './app/models/note'

class HelloWorldApp < Sinatra::Base
  helpers Sinatra::Param
  use Rack::Parser

  configure :development do
    register Sinatra::Reloader
  end

  # run this block for all endpoints that don't start with 'views'
  before '^(?!views).+' do
    content_type :json
    request.body.rewind
    @request_body    = request.body.read
    @request_payload = JSON.parse(@request_body) unless @request_body.empty?
  end

  get '/notes' do
    all_notes = Note.all
    json notes: all_notes
  end

  post '/notes' do
    param :comment, String, required: true
    param :category, String

    status 201
    json note: "Received comment with category #{params[:category]}"
  end

  get'/views/notes' do
    @all_notes = Note.all
    erb :all_notes
  end

end
