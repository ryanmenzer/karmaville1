class AddKPointsIndexDescToUsers < ActiveRecord::Migration
  def change
    remove_index :users, :k_points
  end
end
