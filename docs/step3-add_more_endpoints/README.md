# Add more Endpoints

## Questions

1. What are some differences between a `GET` and a `POST` http method?
1. What is an HTTP Status? What are some common examples?
1. What is JSON?

## Instructions

1. Add Sinatra Reloader, Rack Parser, JSON gems

  ```ruby
  # Gemfile
  ...
  gem 'sinatra-contrib'
  gem 'rack-parser', require: 'rack/parser'
  gem 'json'
  ```

  ```ruby
  #app.rb
  require 'sinatra'
  require 'sinatra/param'
  require 'sinatra/reloader'
  require 'json'
  require 'rack/parser'
  require 'sinatra/json'

  class HelloWorldApp < Sinatra::Base
    helpers Sinatra::Param

    configure :development do
      register Sinatra::Reloader
    end

    before do
      content_type :json
      request.body.rewind
      @request_body    = request.body.read
      @request_payload = JSON.parse(@request_body) unless @request_body.empty?
    end

  ...
  ```

1. `require` JSON gem
  ```ruby
  # app.rb
  ...
  require 'json'
  ...
  ```

1. Add `POST` endpoint

  ```ruby
  # app.rb

  class HelloWorldApp < Sinatra::Base
    ...

    post '/notes' do
      param :comment, String, required: true
      param :category, String, required: false

      status 201
      json note: "Received comment with category #{params[:category]}"
    end
  end
  ```
