class CreateSubdimensions < ActiveRecord::Migration
  def change
    create_table :subdimensions do |t|
      t.integer :dimension_id
      t.integer :role_id
      t.string :name
      t.string :expectation

      t.timestamps

    end
  end
end
