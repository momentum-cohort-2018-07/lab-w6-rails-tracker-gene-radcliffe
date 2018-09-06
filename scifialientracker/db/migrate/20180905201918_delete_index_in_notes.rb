class DeleteIndexInNotes < ActiveRecord::Migration[5.2]
  def change
    remove_index :notes, :alien_id
  end
end
