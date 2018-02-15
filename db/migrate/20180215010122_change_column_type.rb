class ChangeColumnType < ActiveRecord::Migration[5.0]
  def self.up
    change_column :contacts, :Phone, :string
  end
 
  def self.down
   change_column :contacts, :Phone, :integer
  end
end
