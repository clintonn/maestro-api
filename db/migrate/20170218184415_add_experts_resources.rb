class AddExpertsResources < ActiveRecord::Migration[5.0]
  def change
    create_table :experts_resources, id: false do |t|
      t.integer :expert_id
      t.integer :resource_id
    end
  end
end
