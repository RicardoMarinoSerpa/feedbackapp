class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.integer :staffing_id
      t.integer :sender_user_id
      t.integer :receiver_user_id
      t.integer :subdimension_id
      t.integer :grade
      t.string :comment
      t.boolean :receiver_visible
      t.boolean :mentor_visible

      t.timestamps

    end
  end
end
