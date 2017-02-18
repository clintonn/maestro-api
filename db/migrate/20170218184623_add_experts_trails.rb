class AddExpertsTrails < ActiveRecord::Migration[5.0]
  def change
    create_join_table :expert, :trail
  end
end
