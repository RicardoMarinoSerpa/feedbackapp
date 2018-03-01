class CreateMentorships < ActiveRecord::Migration
  def change
    create_table :mentorships do |t|
      t.integer :mentee_id
      t.integer :mentor_id

      t.timestamps

    end
  end
end
