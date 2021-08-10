class AddCoordinatesToDresses < ActiveRecord::Migration[6.0]
  def change
    add_column :dresses, :latitude, :float
    add_column :dresses, :longitude, :float
  end
end
