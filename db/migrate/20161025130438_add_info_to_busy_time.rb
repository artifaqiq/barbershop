class AddInfoToBusyTime < ActiveRecord::Migration
  def change
    add_column :busy_times, :name, :string
    add_column :busy_times, :phone, :string
    add_column :busy_times, :info, :text
  end
end
