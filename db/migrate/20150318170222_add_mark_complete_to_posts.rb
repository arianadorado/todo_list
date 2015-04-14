class AddMarkCompleteToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :mark_complete, :boolean
  end
end
