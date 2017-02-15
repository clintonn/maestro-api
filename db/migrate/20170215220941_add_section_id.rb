class AddSectionId < ActiveRecord::Migration[5.0]
  def change
    add_column :resources, :section_id, :integer
  end
end
