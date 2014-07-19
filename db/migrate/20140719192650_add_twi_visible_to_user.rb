class AddTwiVisibleToUser < ActiveRecord::Migration
  def change
    add_column :users, :twi_visible, :boolean
  end
end
