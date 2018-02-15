class ChangeCapitals < ActiveRecord::Migration[5.0]
  def change
    rename_column :contacts, :FirstName, :firstname
    rename_column :contacts, :LastName, :lastname
    rename_column :contacts, :Address, :address
    rename_column :contacts, :Phone, :phone
  
  end
end
