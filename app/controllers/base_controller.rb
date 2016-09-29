require 'sinatra'
require 'sinatra/param'
require 'sinatra/reloader'
require 'json'
require 'rack/parser'
require 'sinatra/json'

class BaseController < Sinatra::Base

  helpers Sinatra::Param
  use Rack::Parser
  set :views, Proc.new { File.join(root, "../views") }

  configure :development do
    register Sinatra::Reloader
  end

  before '/api*' do
    content_type :json
    request.body.rewind
    @request_body    = request.body.read
    @request_payload = JSON.parse(@request_body) unless @request_body.empty?
  end

end
