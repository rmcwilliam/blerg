class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :post_id
      t.text :contents
     
      t.timestamps null: false 
    end
  end
end
