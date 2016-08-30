# Connect to Database

1. create database
  ```bash
  createdb my_database
  ```

1. Create _database.yml_ file
  ```yml
  # database.yml

  ---
  development:
    adapter: postgresql
    database: fantasy_svc_dev
  ```

1. Connect to database with ActiveRecord

  ```ruby
  # config.ru

  require 'active_record'

  use ActiveRecord::ConnectionAdapters::ConnectionManagement
  databases = YAML.load_file("config/database.yml")
  ActiveRecord::Base.establish_connection(databases[env])
  ```

1. Create a model

  ```ruby
    # Note

  ```
