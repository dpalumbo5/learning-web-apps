class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.text :comment, null: false
      t.string :category
    end
  end
end
