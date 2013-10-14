class AddKPointsToUsers < ActiveRecord::Migration
  def change
    rename_column :users, :karma_points, :k_points
  end
end
