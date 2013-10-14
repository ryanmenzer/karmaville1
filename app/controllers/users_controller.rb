class UsersController < ApplicationController
  def index
    @users = User.by_karma.page(num)
  end
end
