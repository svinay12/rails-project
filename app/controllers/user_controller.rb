class UserController < Devise::RegistrationsController
  before_action :configure_sign_up_params, if: :devise_controller?  
  

  def show
 
    @user = User.find_by(id: current_user.id)
  end

  def create
    super


  end

  def update
    super
  end

  protected
    def configure_sign_up_params
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :mobile])
    end
end
