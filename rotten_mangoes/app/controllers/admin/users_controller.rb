class Admin::UsersController < ApplicationController

  before_action :must_be_admin
  def index
    @users = User.all
  end


  private
  
  def must_be_admin
    if current_user
      @user = User.find(session[:user_id])
      redirect_to movies_path, notice: "This page is accessible only by Admins #{@user.firstname}!" unless @user.admin == true
    end
  end

end
