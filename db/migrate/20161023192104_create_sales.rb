class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.string :title
      t.integer :percent
      t.text :description

      t.timestamps null: false
    end
  end
end
