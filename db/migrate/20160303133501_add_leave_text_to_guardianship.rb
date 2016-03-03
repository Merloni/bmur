class AddLeaveTextToGuardianship < ActiveRecord::Migration
  def change
    add_column :guardianships, :leave_text, :text
  end
end
