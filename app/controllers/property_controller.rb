class PropertyController < ApplicationController
  def index
  end

  def show
    if user_signed_in? 
      @user = User.find_by(id: current_user.id)
      @property = Property.find_by(user_id:current_user.id)
    end

    
  end

  def new
    if user_signed_in? 
      @user = User.find_by(id: current_user.id)
      @property = @user.properties.new()
    end
    
  end

  def create
    if user_signed_in?
      @user = User.find_by(id: current_user.id)
      @property = @user.properties.new(property_params)

      respond_to do | format|
        if @property.save
          @property.build_address(address_params)
          Rails.logger.info 'saved'
          format.html { redirect_to user_show_url(@property), notice: "property successfully created." }
          format.json { render :show, status: :created, location: @property }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @property.errors, status: :unprocessable_entity }      
        end
      end
    end
  end

  def edit
  end

  def update
  end

  def delete
  end



  # def new_address
  #   if user_signed_in?
  #     @address = Address.new()
  #     @user = User.find_by(id: current_user.id)
  #     @property = Property.new
  #   end
  # end

  # def edit_address
  #   if user_signed_in?
  #     @user = User.find_by(id: current_user.id)
  #     @address = Address.find_by(owner_id:current_user.id)
  #     @property = Property.new
  #   end
  # end

  # def update_address
  #   if user_signed_in? 
  #     @user = User.find_by(id: current_user.id)    
  #     @address = Address.find_by(owner_id:current_user.id)
  #     respond_to do | format|
  #       if ( @address.update(address_params) )
  #         format.html { redirect_to user_show_url(@address), notice: "address successfully updated." }
  #         format.json { render :show, status: :created, location: @address }
  #       else
  #         format.html { render :new_address, status: :unprocessable_entity }
  #         format.json { render json: @address.errors, status: :unprocessable_entity }      
  #       end
  #     end
  #   end
  # end

  # def destroy_address
  # end

  # def create_address
  #   if user_signed_in?  
  #   debugger 
  #     @user = User.find_by(id: current_user.id)
  #     @address = @user.build_address(address_params)
      
  #     respond_to do | format|
  #       if ( @address.save )
  #         format.html { redirect_to user_show_url(@address), notice: "address successfully created." }
  #         format.json { render :show, status: :created, location: @address }
  #       else
  #         format.html { render :new_address, status: :unprocessable_entity }
  #         format.json { render json: @address.errors, status: :unprocessable_entity }      
  #       end
  #     end
  #   end
  # end


  protected

  def address_params
    params.require(:property).permit(:plot_no, :locality, :city, :state, :zipcode)
  end

  def property_params
    params.require(:property).permit(:price, :land_area, :property_type, :floor, :address_attributes => [:plot_no, :locality, :city, :state, :zipcode])
  end
end
