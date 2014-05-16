class ProfileController < ApplicationController
  def index
    p @current_user = User.find(session[:user_id])
  end

  def edit
  end

  def view
  end

  def save
  end
end
