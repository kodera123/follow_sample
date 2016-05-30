class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :body
      t.integer :user_id

      t.timestamps null: false
      t.index :user_id
      t.index :created_at
    end
  end
end
