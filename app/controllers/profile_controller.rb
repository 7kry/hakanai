class ProfileController < ApplicationController
  def index
    login_required or return
    redirect_to "/profile/#{ @user.id }"
  end

  def edit
    login_required or return
    @pagetitle = "プロフィールを編集"
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
      @pagetitle = "#{ @user.name }さんのプロフィール"
      render :action => 'view'
    rescue ActiveRecord::RecordNotFound
      @message = "そのユーザは存在しません。"
      render 'error/not_found', status: 404
      return
    end
  end

  def save
    login_required or return

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
