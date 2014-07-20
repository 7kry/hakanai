class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.integer     :user_id
      t.foreign_key :users
      t.text        :first
      t.text        :second
      t.boolean     :deleted

      t.timestamps
    end
  end
end
