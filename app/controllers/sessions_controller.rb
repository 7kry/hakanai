class SessionsController < ApplicationController
  def callback
    p auth = request.env['omniauth.auth']

    red_to =\
      if user = User.find_by(provider: auth['provider'], user_id: auth['uid'])
        root_path
      else
        user = User.create_with_omniauth(auth)
        root_path
      end
    session[:user_id] = user.id
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
