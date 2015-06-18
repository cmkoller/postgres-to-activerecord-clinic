class CreateDogs < ActiveRecord::Migration
  def change
    create_table :dogs do |t|
      t.string :name, null: false
      t.integer :age, null: false
      t.integer :owner_id
    end
  end
end
