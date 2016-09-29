require './config/boot'

Dir.glob('./app/{controllers}/*.rb').each { |file| require file }

map('/')          { run BaseController }
map('/api/notes') { run NotesController }
map('/views')     { run ViewsController }
