class AddDescriptionTextToGuardianships < ActiveRecord::Migration
  def change
    add_column :guardianships, :description_text, :text
  end
end
