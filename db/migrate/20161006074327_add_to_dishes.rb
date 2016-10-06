class AddToDishes < ActiveRecord::Migration
  def change
    add_column :dishes, :cost, :integer
  end
end
