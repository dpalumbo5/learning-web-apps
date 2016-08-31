require './app'
require 'active_record'

run HelloWorldApp

use ActiveRecord::ConnectionAdapters::ConnectionManagement
databases = YAML.load_file("config/database.yml")
ActiveRecord::Base.establish_connection(databases[env])
