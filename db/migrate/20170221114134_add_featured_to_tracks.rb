class AddFeaturedToTracks < ActiveRecord::Migration[5.0]
  def change
    add_column :trails, :featured, :boolean, default: false
  end
end
