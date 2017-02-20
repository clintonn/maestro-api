class RenameStatusToCompleted < ActiveRecord::Migration[5.0]
  def change
    rename_column :follows, :status, :completed
  end
end
