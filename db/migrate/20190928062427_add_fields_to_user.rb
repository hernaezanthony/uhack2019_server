class AddFieldsToUser < ActiveRecord::Migration[5.1]
  def change
  	add_column :users, :full_name, :string
  	add_column :users, :age, :string
  	add_column :users, :birthday, :string
  	add_column :users, :mobile_number, :string
  	add_column :users, :email_address, :string
  end
end
