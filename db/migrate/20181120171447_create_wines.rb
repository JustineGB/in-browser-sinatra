class CreateWines < ActiveRecord::Migration
  def change
    create_table :wines do |t|
      t.string :name
      t.integer :year
      t.integer :rating 
      t.string :tasting_notes
    end
  end
end
