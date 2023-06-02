class ProjectController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :requirement_index]
  def index
    if user_signed_in? 
      @user = current_user
    end 
      @property = Property.all
      @projects = Project.all.with_attached_project_images
      @users = User.all.with_attached_profile_image
  end


  def requirement_index
    if user_signed_in? 
      @user = current_user
    end 
      @projects = Project.where(generated_by:'client').with_attached_project_images
      @users = User.all.with_attached_profile_image
  end

  def requirement_show 
    if user_signed_in? 
      @user = current_user
    end
      @project = Project.where(id:project_param).with_attached_project_images.first 
      @client = User.where(id: @project.client_id).first    
  end

  def show 
    if user_signed_in? 
      @user = current_user
    end
      @project = Project.where(id:project_param).with_attached_project_images      
  end

  def new
    if user_signed_in? 
      @user = User.find(current_user.id)
      @project = Project.new   
      @project.build_address
      @builder = User.all
    end
    respond_to do |format|
      format.js
    end
  end

  def create
    if user_signed_in?
      @user = current_user
      @project = Project.new(project_params)

      respond_to do | format |
        if @project.save
          Rails.logger.info 'saved'
          format.html { redirect_to user_url(@user), notice: "Project successfully created." }
          format.json { render :show, status: :created, location: @project }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @project.errors, status: :unprocessable_entity }      
        end
      end
    end
  end

  def edit
    if user_signed_in? 
      @user = current_user
      @project = Project.find(project_param)
    end
  end

  def update
    @user = current_user
    Project.find(project_param).update(project_params)

    respond_to do |format|
      format.html { redirect_to user_url(project_param), notice: "Project was successfully updated." }
      format.json { head :no_content }
    end
  end

  def destroy
    @user = current_user
    Project.find(project_param).destroy

    respond_to do |format|
      format.html { redirect_to user_url(project_param), notice: "Project was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  protected
  def project_param
    params.require(:id)
  end
  def project_params
    params.require(:project).permit(:budget, :time, :project_type, :details, :client_id , :builder_id, :generated_by , :address_attributes => [:plot_no, :locality, :city, :state, :zipcode],project_images:[])
  end
end
