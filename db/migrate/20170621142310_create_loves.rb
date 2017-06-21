class CreateLoves < ActiveRecord::Migration[5.1]
  def up
    create_table :loves do |t|
      t.boolean 'post'
      t.integer 'postID'
      t.integer 'commentID'
      t.string 'author_ip', limit: 30, null: false
      t.timestamps
    end
  end

  def down
    drop_table :loves
  end
end
