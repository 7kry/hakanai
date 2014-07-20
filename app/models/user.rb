class User < ActiveRecord::Base
  has_many :issue

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider    = auth['provider']
      user.user_id     = auth['uid']
      user.screen_name = auth['info']['nickname']
      user.name        = auth['info']['name']
      user.description = auth['info']['description']
    end
  end
end
