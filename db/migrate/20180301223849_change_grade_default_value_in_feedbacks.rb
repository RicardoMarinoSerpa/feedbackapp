class ChangeGradeDefaultValueInFeedbacks < ActiveRecord::Migration[5.0]
  def change
    change_column_default :feedbacks, :grade, '0'
  end
end
