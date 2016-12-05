class CreateForumComments < ActiveRecord::Migration
  def change
    create_table :forum_comments do |t|
      t.integer :user_id
      t.integer :forum_id
      t.text :body

      t.timestamps null: false
    end
  end
end
