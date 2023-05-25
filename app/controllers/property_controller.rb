class PropertyController < ApplicationController
  def index
    if user_signed_in? 
      @user = current_user
      @property = Property.all
      @project = Project.all
    end 
  end

  def show
    if user_signed_in? 
      @user = current_user
      @property = @user.properties
    end    
  end

  def new
    if user_signed_in? 
      @user = current_user
      @property = @user.properties.new()
      @property.build_address
    end
    
  end

  def create
    if user_signed_in?
      @user = current_user
      @property = @user.properties.new(property_params)

      respond_to do | format|
        if @property.save
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
    if user_signed_in? 
      @user = current_user
      @property = @user.properties.find(property_param)
    end
  end

  def update
    @user = current_user
    @user.properties.find(property_param).update(property_params)
    respond_to do |format|
      format.html { redirect_to user_show_url, notice: "Property was successfully updated." }
      format.json { head :no_content }
    end
  end

  def destroy
    @user = current_user
    @user.properties.find(property_param).destroy

    respond_to do |format|
      format.html { redirect_to user_show_url, notice: "Property was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  protected
  def property_param
    params.require(:id)
  end
 
  def property_params
    params.require(:property).permit(:id, :price, :land_area, :property_type, :floor, :address_attributes => [:plot_no, :locality, :city, :state, :zipcode])
  end
end
