class AddUserIdToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :user_id, :integer # added column and filled it in below 
    Post.find_each do |p|
      p.update(user_id: 1)
    end
    change_column :posts, :user_id, :integer, null: false # set column so that it cannot be empty 
  end
end
