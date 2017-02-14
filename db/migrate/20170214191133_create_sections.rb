class CreateSections < ActiveRecord::Migration[5.0]
  def change
    create_table :sections do |t|
      t.string :title
      t.integer :trail_id
      t.timestamps
    end
  end
end
