class AddAddressToDresses < ActiveRecord::Migration[6.0]
  def change
    add_column :dresses, :address, :string
  end
end
