class CreateVerticals < ActiveRecord::Migration[5.2]
  def change
    create_table :verticals do |t|
      t.string :name

      t.timestamps
    end
    add_index :verticals, :name, unique: true
  end
end
