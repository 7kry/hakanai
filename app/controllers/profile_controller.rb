class ProfileController < ApplicationController
  def index
    if session[:user_id].nil?
      render 'error/please_login', status: 403
      return
    end
    @user = User.find(session[:user_id])
    self.view
  end

  def edit
    if session[:user_id].nil?
      render 'error/please_login', status: 403
      return
    end
    @user = User.find(session[:user_id])
  end

  def view
    begin
      if not @user
        @user = User.find(params[:id])
      end
      if @user.deleted
        @message = "そのユーザは削除されました。"
        render 'error/not_found', status: 410
        return
      end
      render :action => 'view'
    rescue ActiveRecord::RecordNotFound
      @message = "そのユーザは存在しません。"
      render 'error/not_found', status: 404
      return
    end
  end

  def save
    if session[:user_id].nil?
      render 'error/please_login', status: 403
      return
    end
    @user = User.find(session[:user_id])

    @user.attributes = params.require(:user).permit(:name, :description, :provider_visible)
    if img = params.fetch(:user, {}).fetch(:profile_image, nil)
      @user.profile_image = p Magick::Image::from_blob(img.read).first.resize_to_fit(128, 128).to_blob
    end
    @user.save

    redirect_to '/profile'
  end

  def icon
    user = User.find_by(:id => params[:id])
    if user && user.profile_image
      send_data(user.profile_image)
    else
      redirect_to "/noicon.png"
    end
  end
end
