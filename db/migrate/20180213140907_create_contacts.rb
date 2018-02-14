class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :FirstName
      t.string :LastName
      t.integer :Phone
      t.string :Email
      t.string :Address

      t.timestamps null: false
    end
  end
end
