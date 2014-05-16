class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :user_id
      t.string :screen_name
      t.string :name
      t.string :profile_image
      t.string :descripton
      t.boolean :link_twitter

      t.timestamps
    end
  end
end