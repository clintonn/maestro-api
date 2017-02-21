class AddImageUrlToTrails < ActiveRecord::Migration[5.0]
  def change
    add_column :trails, :image_url, :string
  end
end
