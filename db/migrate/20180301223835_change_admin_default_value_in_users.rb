class ChangeAdminDefaultValueInUsers < ActiveRecord::Migration[5.0]
  def change
    change_column_default :users, :admin, '0'
  end
end
