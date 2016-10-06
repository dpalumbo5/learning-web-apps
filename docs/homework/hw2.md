# HW2 - Add a `completed` field to the Note model.

### Instructions

##### 1. Create migration file for the new `completed` column to the `notes` table in the database.
  In the console, run
  ```sh
  bundle exec rake db:new_migration[add_completed_to_notes]
  ```
  This will generate a new file in the `db/migrate/` directory called `20161006163909_add_completed_to_notes.rb`

##### 2. Add code to new migration file
  Open the new migration file in vim and add the following code:
  ```ruby
  class AddCompletedToNotes < ActiveRecord::Migration
    def change
      add_column :notes, :completed, :boolean, default: false
    end
  end
  ```
  When this migration is run, it will add a new column called `:completed` to the `notes` table. The data-type for the new column is a `boolean` which means that the value for the field must be either `true` or `false`. For example, you could do
  ```ruby
  note = Note.create!(
    comment: 'some comment',
    category: 'some cateogry',
    completed: false
  )
  ```
  But you cannot do this:
  ```ruby
  note = Note.create!(
    comment: 'some comment',
    category: 'some cateogry',
    completed: "some string value"
  )
  ```

##### 3. Run the migration
  In the console, run
  ```sh
  bundle exec rake db:migrate
  ```
  Now the `notes` table in the database has a new column called `completed`. This means that all notes will now have a new field called `completed`. To verify this, try running `script/console` and enter the following code:
  ```ruby
  note = Note.last
  note.completed
  # output should return => false
  ```

##### 4. Add the new `completed` column value to your Specific Note ERB view
  This you should do on your own.

##### 5. Add the new `completed` column to the All Notes ERB view
  This you should do on your own.

### Questions that you should be able to answer by the end of this assignment

1. In your own words, how would you summarize what we did in step 1?
1. In your own words, how would you summarize what we did in step 2?
1. In your own words, how would you summarize what we did in step 3?
