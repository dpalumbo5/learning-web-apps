require 'rubygems'
require 'sinatra'
require 'sinatra/json'
require 'active_record'
require 'yaml'

$: << File.expand_path('../../app', __FILE__)

ENV['RACK_ENV'] ||= 'development'
require 'bundler'
Bundler.setup(:default, ENV['RACK_ENV'])

# setting up our environment
env_index = ARGV.index("-e")
env_arg = ARGV[env_index + 1] if env_index
env = env_arg || ENV['RACK_ENV']

use ActiveRecord::ConnectionAdapters::ConnectionManagement
databases = YAML.load_file("config/database.yml")
ActiveRecord::Base.establish_connection(databases[env])

