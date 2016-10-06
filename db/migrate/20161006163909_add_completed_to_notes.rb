class AddCompletedToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :completed, :boolean, default: false
  end
end
