class AddVotesCountToTrails < ActiveRecord::Migration[5.0]
  def change
    change_table :trails do |t|
      t.integer :votes_count, default: 0
    end
  end
end
