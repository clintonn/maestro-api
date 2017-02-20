class CreateFollows < ActiveRecord::Migration[5.0]
  def change
    create_table :follows do |t|
      t.integer :trail_id
      t.integer :user_id
      t.boolean :status

      t.timestamps
    end
  end
end
