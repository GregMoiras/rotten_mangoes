class Admin::UsersController < ApplicationController

  before_action :must_be_admin, except: [:switch_back]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to admin_users_path, notice: "#{@user.firstname} #{@user.lastname} was created successfully!"
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      redirect_to admin_user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    
    @user = User.find(params[:id])
    if @user
      respond_to do |format|
        UserMailer.delete_user_email(@user)
        format.html { redirect_to(admin_users_path, notice: 'User was successfully deleted.') }
        @user.destroy
      end
    else
      redirect_to admin_users_path
    end
  end

  def switch_to
    session[:admin_user] = current_user.id 
    @switch_user = User.find(params[:id])
    session[:user_id] = @switch_user.id
    redirect_to movies_path, notice: "Switched to #{@switch_user.firstname} #{@switch_user.lastname}'s RottenMangoes Page!"
  end

  def switch_back
    id = session[:admin_user]
    session[:user_id] = id
    session[:admin_user] = nil
    redirect_to admin_users_path, notice: "Switched back to admin page."
  end

  private
  
  def must_be_admin
    redirect_to movies_path, notice: "This page is accessible only by Admins #{current_user.firstname}!" unless current_user.admin == true
  end

  def user_params
    params.require(:user).permit(:email, :firstname, :lastname, :password, :password_confirmation, :admin)
  end

end
