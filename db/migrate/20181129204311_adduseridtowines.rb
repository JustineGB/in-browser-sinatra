class Adduseridtowines < ActiveRecord::Migration
  def change
    add_column :wines, :user_id, :integer 
  end
end
