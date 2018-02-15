class Changecolumemail < ActiveRecord::Migration[5.0]
  def change
    rename_column :contacts, :Email, :email
  end
end
