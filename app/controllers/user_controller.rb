class UserController < ApplicationController
  before_action :configure_sign_up_params, if: :devise_controller?  
  

  def show
    if user_signed_in? 
      @user = User.find_by(id: current_user.id)
      @address = Address.find_by(owner_id:current_user.id)
    end
  end

  def index
  end

  def edit_address
    @user = User.find_by(id: current_user.id)
    @address = Address.find_by(owner_id:current_user.id)
  end

  def update_address
  end

  def update_address
  end

  def destroy_address
  end

  protected
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :mobile, :user_type])
  end
end
