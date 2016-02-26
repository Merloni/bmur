class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name
      t.boolean :ban

      t.timestamps null: false
    end
  end
end
