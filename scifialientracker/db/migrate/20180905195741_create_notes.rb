class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.integer :alien_id
      t.string :body

      t.timestamps
    end
  end
end
