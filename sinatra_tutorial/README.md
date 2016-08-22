# Sinatra Tutorial

## Questions

1. What is a web applicaiton?

## Instructions

1. Create a new directory from command line:

```bash
mkdir sinatra_tutorial
cd sinatra_tutorial
```

2. Add application file

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

3. Add config file

```bash
touch config.ru
```

```ruby
# config.ru

require './app'

run HelloWorldApp
```

4. Run application

```bash
rackup
```




