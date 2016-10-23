class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.string :name
      t.string :value
      t.belongs_to :service

      t.timestamps null: false
    end
  end
end
