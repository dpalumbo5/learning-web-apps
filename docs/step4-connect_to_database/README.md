# Connect to Database

1. Create _database.yml_ file
  ```yml
  # config/database.yml

  ---
  development:
    adapter: postgresql
    database: my_database
  ```

1. Add _RakeFile_ and connect to ActiveRecord

  ```ruby
  # Rakefile

  require 'active_record_migrations'

  ActiveRecordMigrations.configure do |c|
    c.yaml_config = 'config/database.yml'
  end

  ActiveRecordMigrations.load_tasks
  ```

1. create _db/_ directory
  ```bash
  mkdir db/
  ```
1. Generate _schema_
  ```bash
  bundle exec rake db:seed
  ```

1. create database
  ```bash
  createdb my_database
  ```

1. Connect Application to database with ActiveRecord

  ```ruby
  # config/boot.rb

  require 'active_record'
  require 'yaml'
  require 'bundler'

  # setting up our environment
  env_index = ARGV.index("-e")
  env_arg = ARGV[env_index + 1] if env_index
  env = env_arg || 'development'
  ENV['RACK_ENV'] ||= env
  Bundler.setup(:default, env)

  # connect to database
  use ActiveRecord::ConnectionAdapters::ConnectionManagement
  databases = YAML.load_file("config/database.yml")
  ActiveRecord::Base.establish_connection(databases[env])

  ```

  ```ruby
  # config.ru

  require './config/boot'

  run HelloWorldApp
  ```

1. Create a model

  ```ruby
    # app/models/note.rb
    
    class Note < ActiveRecord::Base
      
    end
  ```

1. Generate migration file
  ```bash
    bundle exec rake db:new_migration[create_notes]
  ```

1. Edit migration file to create notes table
  ```ruby
  # db/migrations/20160831175032_create_notes.rb

  class CreateNotes < ActiveRecord::Migration
    def change
      create_table :notes do |t|
        t.text :comment, null: false
        t.string :category
      end
    end
  end
  ```

1. Run the migration

  ```bash
  bundle exec rake db:migrate
  ```

1. Setup _config/console_

  ```ruby
  # config/console.rb

  require './config/boot'
  require 'pry'

  Dir['./app/**/*.rb'].each {|file| require file}
  Pry.start
  ```

1. Setup _script/console_

  ```ruby
  #!/bin/bash -e

  bundle exec pry -r ./config/console
  ```

1. Give _script/console_ executable permission

  ```bash
  chmod +x script/console
  ```

1. Create some notes in the Database

  ```bash
  script/console

  pry(main)>
