require 'controllers/base_controller'
require './app/models/note'

class ViewsController < BaseController

  get '/notes' do
    @all_notes = Note.all
    erb :all_notes
  end

  get '/notes/new' do
    erb :new_note
  end

  post '/notes' do
    param :comment, String, required: true
    param :category, String

    Note.create!(
      comment: params[:comment],
      category: params[:category]
    )

    @notes = Note.all

    redirect to('/notes')
  end

  # TODO for Dan (10/4/16)
  # Add a new endpoint here that shows a SPECIFIC note. For example, if I go to
  # localhost:9292/notes/4 in the browser, I should expect to see the following:
  #
  # Comment                                 | Category
  # --------------------------------------- | --------
  # This is the comment for note with ID 4. | Note 4 category
  #
  #
  get '/notes/:id' do
    # First, get the note from the database.
    #
    # Return the name of the erb view that will display the single note. This
    # file will need to be created in the app/views/, similar to the
    # app/views/all_notes.erb view file.
  end

end
