class RemoveIsModeratorFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :is_moderator, :boolean
  end
end
