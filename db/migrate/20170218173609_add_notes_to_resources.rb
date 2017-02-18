class AddNotesToResources < ActiveRecord::Migration[5.0]
  def change
    add_column :resources, :notes, :string
  end
end
