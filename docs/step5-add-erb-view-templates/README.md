# Add ERB View templates

1. Modify `before` block in *app.rb*:
  ```ruby
  # app.rb
  ...

  # run this block for all endpoints that don't start with 'views'
  before '^(?!views).+' do
    content_type :json
    request.body.rewind
    @request_body    = request.body.read
    @request_payload = JSON.parse(@request_body) unless @request_body.empty?
  end
  ...
  ```
1. Add endpoint for returning all notes erb view:
  ```ruby
  # app.rb
  ...

  get'/views/notes' do
    @all_notes = Note.all
    erb :all_notes
  end
  ...
  ```
1. Add *all_notes.erb* view template:
  ```bash
  touch views/all_notes.erb
  ```
  ```erb
  <!-- views/all_notes.erb -->

  <!DOCTYPE html>
  <html>
    <body>
        <h1>All Notes</h1>
        <ul>
          <table>
            <thead>
              <tr>
                <th>Category</th>
                <th>Comment</th>
              </tr>
            </thead>
            <tbody>
              <% @all_notes.each do |note| %>
              <tr>
                <td><%= note.comment %></td>
                <td><%= note.category %></td>
              </tr>
            <% end %>
            </tbody>
          </table>
        </ul>
    </body>
  </html>
  ```
