class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :catagory
      t.string :priority
      t.boolean :completed

      t.timestamps null: false
    end
  end
end
