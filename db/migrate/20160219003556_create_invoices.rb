class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.integer :quantity
      t.string :color
      t.string :type
      t.datetime :orderDate
      t.datetime :requiredDate
      t.datetime :deliveryDate
      t.string :status
      t.references :customer, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
