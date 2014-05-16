class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.uid :provider
      t.string :user_id
      t.string :screen_name
      t.string :name
      t.binary :profile_image
      t.string :descripton

      t.timestamps
    end
    add_index :users, :provider
    add_index :users, :user_id
  end
end
