class KarmaPoint < ActiveRecord::Base
  attr_accessible :user_id, :label, :value
  belongs_to :user

  validates :user, :presence => true
  validates :value, :numericality => {:only_integer => true, :greater_than_or_equal_to => 0}
  validates :label, :presence => true


  after_create :update_karma
  after_save  :update_karma


  def update_karma
    user = User.find(self.user_id)
    user_ks = user.karma_points.sum(:value)
    user.update_attributes(k_points: user_ks)
  end

end
