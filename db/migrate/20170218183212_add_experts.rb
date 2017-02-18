class AddExperts < ActiveRecord::Migration[5.0]
  def change
    create_table :experts do |t|
      t.string :first_name
      t.string :last_name
      t.text :bio
      t.string :avatar_url
    end
  end
end
