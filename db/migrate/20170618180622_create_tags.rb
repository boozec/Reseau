class CreateTags < ActiveRecord::Migration[5.1]
  def up
    create_table :tags do |t|
      t.string 'word', :limit => 10, :null => false
      t.boolean 'post'
      t.integer 'postID'
      t.integer 'commentID'
      t.timestamps
    end
  end

  def down
    drop_table :tags
  end
end
