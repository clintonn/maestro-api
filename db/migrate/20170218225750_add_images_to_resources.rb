class AddImagesToResources < ActiveRecord::Migration[5.0]
  def change
    add_column :resources, :image_url, :string
  end
end
