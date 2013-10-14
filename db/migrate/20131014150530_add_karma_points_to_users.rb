class AddKarmaPointsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :karma_points, :integer
    add_index :users, :karma_points
    add_index :karma_points, :user_id
  end
end
