require 'controllers/base_controller'
require './app/models/note'

class NotesController < BaseController

  get '/' do
    all_notes = Note.all
    json notes: all_notes
  end

  post '/' do
    param :comment, String, required: true
    param :category, String

    note = Note.create!(
      comment: params[:comment],
      category: params[:category]
    )

    status 201
    json notes: note
  end

end
