class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :companyName
      t.string :email
      t.string :fname
      t.string :lname
      

      t.timestamps null: false
    end
  end
end
