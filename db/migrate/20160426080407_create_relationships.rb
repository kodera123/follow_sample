class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :follower_id
      t.integer :following_id

      t.timestamps null: false

      t.index :follower_id
      t.index :following_id
    end
  end
end
