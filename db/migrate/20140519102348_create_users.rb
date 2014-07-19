class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :provider
      t.string  :user_id
      t.string  :screen_name
      t.string  :name
      t.binary  :profile_image
      t.string  :description
      t.boolean :is_moderator

      t.timestamps
    end
  end
end
