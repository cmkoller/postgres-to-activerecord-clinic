class CreateOwners < ActiveRecord::Migration
  def change
    create_table :owners do |t|
      t.string :name, null: false
    end
  end
end
