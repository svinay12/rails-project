class PageController < ApplicationController
  
  def index
    if user_signed_in?
      @user = User.find_by(id: current_user.id)
    end
      @users = User.where(user_type:'builder').with_attached_profile_image
      @projects = Project.all.with_attached_project_images
      @property = Property.all.with_attached_property_images
  end
end
