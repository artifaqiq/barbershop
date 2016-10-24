class CreateFreeTimes < ActiveRecord::Migration
  def change
    create_table :free_times do |t|

      t.datetime :begin
      t.datetime :end
      t.string :service

      t.timestamps null: false
    end
  end
end
