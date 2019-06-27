class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :state
      t.references :vertical, foreign_key: true

      t.timestamps
    end
    add_index :categories, :name, unique: true
  end
end
