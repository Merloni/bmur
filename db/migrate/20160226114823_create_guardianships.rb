class CreateGuardianships < ActiveRecord::Migration
  def change
    create_table :guardianships do |t|
      t.datetime :endtime

      t.timestamps null: false
    end
  end
end
