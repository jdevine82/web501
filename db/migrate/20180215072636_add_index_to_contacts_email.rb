class AddIndexToContactsEmail < ActiveRecord::Migration[5.0]
  def change
        add_index :contacts, :Email, unique: true

  end
end

