class AddFieldsToDevice < ActiveRecord::Migration[5.1]
  def change
  	add_column :devices, :user_id, :string
  	add_column :devices, :status, :string
  	add_column :devices, :percentage, :string
  	add_column :devices, :serial_number, :string
  	add_column :devices, :location, :string
  end
end
