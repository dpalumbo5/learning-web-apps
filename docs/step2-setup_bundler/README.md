# Setup Bundler

## Questions

1. What is a Bundler?

1. What is a package manager?

1. What is a Gemfile?

## Instructions

1. Add _Gemfile_

  ```bash
  touch Gemfile
  ```

  ```ruby
  # Gemfile

  source 'https://rubygems.org'

  # application server
  gem 'sinatra'
  gem 'sinatra-param', require: 'sinatra-param'

  # orm
  gem 'activerecord'

  # db
  gem 'pg'
  gem 'active_record_migrations'

  # client
  gem 'json'

  # debugger
  gem 'pry'
  ```

1. Install bundles

  ```bash
  bundle install
  ```

1. Add config folder

  ```bash
  mkdir config/
  ```

1. Add _boot.rb_

  ```bash
  touch config/boot.rb
  ```

1. Set up Bundler

  ```ruby
  # config/boot.rb

  require 'active_record'
  require 'bundler'

  # setting up our environment
  env_index = ARGV.index("-e")
  env_arg = ARGV[env_index + 1] if env_index
  env = env_arg || 'development'
  ENV['RACK_ENV'] ||= env
  Bundler.setup(:default, env)
  ```

  ```ruby
  # config.ru

  require ./config/boot
  require './app'

  run HelloWorldApp
  ```
