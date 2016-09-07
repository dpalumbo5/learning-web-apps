require 'sinatra'
require 'sinatra/param'
require 'sinatra/reloader'
require 'json'
require 'rack/parser'
require 'sinatra/json'


class HelloWorldApp < Sinatra::Base
  helpers Sinatra::Param
  use Rack::Parser

  configure :development do
    register Sinatra::Reloader
  end

  before do
    content_type :json
    request.body.rewind
    @request_body    = request.body.read
    @request_payload = JSON.parse(@request_body) unless @request_body.empty?
  end

  get '/' do
    "Hello, world!"
  end

  get '/:name' do
    "Hello, #{params[:name]}!"
  end

  post '/notes' do
    param :comment, String, required: true
    param :category, String

    status 201
    json note: "Received comment with category #{params[:category]}"
  end

end
