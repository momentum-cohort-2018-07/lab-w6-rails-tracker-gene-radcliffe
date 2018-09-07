class CreateAliens < ActiveRecord::Migration[5.2]
  def change
    create_table :aliens do |t|
      t.string :name
      t.string :specie
      t.string :notes
      t.string :home_world

      t.timestamps
    end
  end
end
