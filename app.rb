require 'sinatra'

class HelloWorldApp < Sinatra::Base

  get '/' do
    "Hello, world!"
  end

  get '/:name' do
    "Hello, #{params[:name]}!"
  end

  post '/notes' do
    param :comment, String, required: true
    param :category, String

    "Hello, #{params[:name]}!"
  end

end
