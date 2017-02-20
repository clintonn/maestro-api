class AddDefaultValueToStatusAttribute < ActiveRecord::Migration[5.0]
  def change
    change_column :follows, :status, :boolean, :default => false
  end
end
