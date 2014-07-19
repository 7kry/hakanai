class RemoveTwiVisibleFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :twi_visible, :boolean
  end
end
