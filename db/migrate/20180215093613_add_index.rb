class AddIndex < ActiveRecord::Migration[5.0]
  def change
        add_index :contacts, :email, unique: true

  end
end

