class AddCreatedAtToOrder < ActiveRecord::Migration
  def change
    change_table :orders do |t|
      t.timestamps
    end
  end
end
