class UserController < ApplicationController
  def show
    if user_signed_in? 
      @user = User.find_by(id: current_user.id)
    end
  end

  def index
  end
end
