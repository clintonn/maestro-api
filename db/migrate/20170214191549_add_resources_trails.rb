class AddResourcesTrails < ActiveRecord::Migration[5.0]
  def change
    create_table :resources_trails, :id => false do |t|
      t.integer :resource_id
      t.integer :trail_id
    end
  end
end
