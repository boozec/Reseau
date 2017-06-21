class CreatePosts < ActiveRecord::Migration[5.1]
  def up
    create_table :posts do |t|
      t.string 'titolo', limit: 50, null: false
      t.integer 'author', null: false
      t.string 'author_ip', limit: 30, null: false
      t.integer 'category', null: false
      t.text 'blocktest', null: false
      t.timestamps
    end
  end

  def down
    drop_table :posts
  end
end
