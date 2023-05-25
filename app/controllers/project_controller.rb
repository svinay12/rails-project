class ProjectController < ApplicationController
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
      @project = @user.projects      
    end
  end

  def new
    if user_signed_in? 
      @user = current_user
      @project = Project.new   
      @project.build_address
      @builder = User.all
    end
  end

  def create

    if user_signed_in?
      debugger
      @user = current_user
      @project = Project.new(project_params)

      respond_to do | format |
        if @project.save
          Rails.logger.info 'saved'
          format.html { redirect_to user_show_url(@project), notice: "Project successfully created." }
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
      format.html { redirect_to user_show_url, notice: "Project was successfully updated." }
      format.json { head :no_content }
    end
  end

  def destroy
    @user = current_user
    Project.find(project_param).destroy

    respond_to do |format|
      format.html { redirect_to user_show_url, notice: "Project was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  protected
  def project_param
    params.require(:id)
  end
  def project_params
    params.require(:project).permit(:budget, :time, :project_type, :details, :quotation_file, :client_id , :builder_id , :address_attributes => [:plot_no, :locality, :city, :state, :zipcode])
  end
end
