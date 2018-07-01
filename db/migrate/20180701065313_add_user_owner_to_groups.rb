class AddUserOwnerToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :user_owner, :integer, null: false
  end
end
