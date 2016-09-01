# Add more Endpoints

## Questions

1. What is the difference between `GET`, `POST`, `PUT`, `DELETE` http methods?
1. What is an HTTP Status? What are some common examples?
1. What is JSON?

## Instructions

1. Add 'sinatra-param' gem to _Gemfile_

  ```ruby
  # Gemfile
  ...

  gem 'sinatra-params'
  ```

1. Install new bundle

  ```bash
  bundle install
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
      "Received comment with category #{params[:category]}"
    end
  end
  ```

1. Add `PUT` endpoint

  class HelloWorldApp < Sinatra::Base

    ...


    put '/notes:id' do
      param :id, Integer, required: true
      param :comment, String, required: true
      param :category, String, required: false

      status 201
      "Received comment with category #{params[:category]}"
    end
  end
  ```
