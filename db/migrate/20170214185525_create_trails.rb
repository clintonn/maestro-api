class CreateTrails < ActiveRecord::Migration[5.0]
  def change
    create_table :trails do |t|
      t.string :title
      t.integer :category_id
      t.integer :author_id
      t.text :description
      t.timestamps
    end
  end
end
