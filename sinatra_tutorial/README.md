# Sinatra Tutorial

## Questions

1. What is a web applicaiton?

## Instructions

#### Create a new directory from command line:

```bash
mkdir sinatra_tutorial
cd sinatra_tutorial
```

#### Add application file

```bash
touch app.rb
```

```ruby
# app.rb

require 'sinatra'

class HelloWorldApp < Sinatra::Base

  get '/' do
    "Hello, world!"
  end

end
```

#### Add config file

```bash
touch config.ru
```

```ruby
# config.ru

require './app'

run HelloWorldApp
```

#### Run application

```bash
rackup
```




