require 'pry'
require './config/boot'

Dir['./app/**/*.rb'].each {|file| require file}

Pry.start
