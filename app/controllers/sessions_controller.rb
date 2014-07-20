class SessionsController < ApplicationController
  def callback
    p auth = request.env['omniauth.auth']

    if user = User.find_by(provider: auth['provider'], user_id: auth['uid'])
      user.screen_name = auth['info']['nickname'] || auth['info']['name']
      user.save
    else
      user = User.create_with_omniauth(auth)
    end
    session[:user_id] = user.id
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
