class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  protected

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def restrict_access
    if !current_user
      redirect_to new_session_path, flash:{alert: "You must log in."}
    end
  end

  def admin_user_exists?
    session[:admin_user] != nil 
  end

  def admin?
    current_user.admin if current_user
  end

  def admin_id_when_impersonating
    @hidden_id ||= User.find(session[:admin_user]) if session[:admin_user] 
  end

  def login_user(user)
    session[:user_id] = user.id
  end

  def must_be_admin
    redirect_to movies_path, notice: "This page is accessible only by Admins #{current_user.firstname}!" unless current_user.admin == true #|| User.find(session[:admin_user]).admin == true
  end

  helper_method :current_user, :admin_user_exists?, :admin_id_when_impersonating, :admin?, :must_be_admin

end