class ProfileController < ApplicationController
  def index
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
    send_data(
      User.find_by(:provider => @provider, :user_id => @user_id).profile_image,
      :disposition => :inline)
  end
end
