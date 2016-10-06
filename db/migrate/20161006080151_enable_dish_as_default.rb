class EnableDishAsDefault < ActiveRecord::Migration
  def change
    change_column_default(:dishes, :enable, true)
  end
end
