class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def restrict_access
    if !current_user
      flash[:alert] = "You must log in."
      redirect_to new_session_path
    end
  end

  def admin_user_exists?
    session[:admin_user] != nil #must exist // change name of session to admin_user_id
  end

  def admin?
    current_user.admin if current_user
  end

  def admin_id_when_impersonating
    @hidden_id ||= User.find(session[:admin_user]) if session[:admin_user] 
  end

  def must_be_admin
    redirect_to movies_path, notice: "This page is accessible only by Admins #{current_user.firstname}!" unless current_user.admin == true #|| User.find(session[:admin_user]).admin == true
  end

  helper_method :current_user, :admin_user_exists?, :admin_id_when_impersonating, :admin?, :must_be_admin

end