class AddUserIdToGuardianships < ActiveRecord::Migration
  def change
    add_column :guardianships, :user_id, :integer
  end
end
