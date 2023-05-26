class UserController < ApplicationController
  before_action :configure_sign_up_params, if: :devise_controller?  
  

  def show
    if user_signed_in? 
      @user = User.find_by(id: current_user.id)
      @address = Address.find_by(owner_id:current_user.id)
      @property = @user.properties.all.with_attached_property_images
      @project = Project.where(client_id: current_user.id).with_attached_project_images
    end
  end

  def index
    @user = User.find_by(id: current_user.id)
    @users = User.where(user_type:'builder').with_attached_profile_image
  end

  def new_address
    if user_signed_in?
      @address = Address.new()
      @user = User.find_by(id: current_user.id)
    end
  end

  def edit_address
    if user_signed_in? 
      @user = User.find_by(id: current_user.id)
      @address = Address.find_by(owner_id:current_user.id)
    end
  end

  def update_address
    if user_signed_in? 
      @user = User.find_by(id: current_user.id)    
      @address = Address.find_by(owner_id:current_user.id)
      respond_to do | format|
        if ( @address.update(address_params) )
          format.html { redirect_to user_show_url(@address), notice: "address successfully updated." }
          format.json { render :show, status: :created, location: @address }
        else
          format.html { render :new_address, status: :unprocessable_entity }
          format.json { render json: @address.errors, status: :unprocessable_entity }      
        end
      end
    end
  end

  def destroy_address
  end

  def create_address
    if user_signed_in?   
      @user = User.find_by(id: current_user.id)
      @address = @user.build_address(address_params)
      
      respond_to do | format|
        if ( @address.save )
          format.html { redirect_to user_show_url(@address), notice: "address successfully created." }
          format.json { render :show, status: :created, location: @address }
        else
          format.html { render :new_address, status: :unprocessable_entity }
          format.json { render json: @address.errors, status: :unprocessable_entity }      
        end
      end
    end
  end

  protected
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :mobile, :user_type, :profile_image])
  end

  def address_params
    params.require(:address).permit(:plot_no, :locality, :city, :state, :zipcode)
  end
end
