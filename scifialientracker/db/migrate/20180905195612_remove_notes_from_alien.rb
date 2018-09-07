class RemoveNotesFromAlien < ActiveRecord::Migration[5.2]
  def change
    remove_column :aliens, :notes, :string
  end
end
