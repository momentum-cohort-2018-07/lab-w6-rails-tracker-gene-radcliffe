class AddIndexToNotes < ActiveRecord::Migration[5.2]
  def change
    add_index :notes, :alien_id
  end
end
