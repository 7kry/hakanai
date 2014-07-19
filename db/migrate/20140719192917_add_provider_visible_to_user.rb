class AddProviderVisibleToUser < ActiveRecord::Migration
  def change
    add_column :users, :provider_visible, :boolean
  end
end
