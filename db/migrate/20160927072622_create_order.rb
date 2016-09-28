class CreateOrder < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :dish_id
    end
  end
end
