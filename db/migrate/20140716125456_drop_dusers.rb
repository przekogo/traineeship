class AddDeviseToUsers < ActiveRecord::Migration
  def change
    drop_table :dusers
  end
end
