class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def login_required
    if session[:user_id]
      @user = User.find(session[:user_id])
    else
      if params[:format] == "json"
        render json: {error: 'Please login.'}, status: 401
      else
        render 'error/please_login', status: 401
      end
      nil
    end
  end

  helper_method :current_user

  private
  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end
end
