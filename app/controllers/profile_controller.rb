class ProfileController < ApplicationController
  def index
    if session[:user_id].nil?
      redirect_to '/please_login'
      return
    end
    @user = User.find(session[:user_id])
    self.view
  end

  def edit
  end

  def view
    if not @user
      @user = User.find_by(:provider => params[:provider], :user_id => params[:id])
    end
    render :action => 'view'
  end

  def save
  end

  def icon
    user = User.find_by(:provider => params[:provider], :user_id => params[:id])
    if user && user.profile_image
      send_data(user.profile_image)
    else
      redirect_to "/noicon.png"
    end
  end
end
