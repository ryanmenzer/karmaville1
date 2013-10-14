class AddKPointsIndexToUsers < ActiveRecord::Migration
  def change
    add_index :users, :k_points
  end
end
