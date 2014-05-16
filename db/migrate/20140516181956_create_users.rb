class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :user_id
      t.string :token
      t.string :token_secret
      t.string :screen_name
      t.string :name

      t.timestamps
    end
  end
end
