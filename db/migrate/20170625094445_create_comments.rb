class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.integer 'author_id', null: false
      t.string 'author_ip', limit: 30, null: false
      t.integer 'post_id', null: false
      t.text 'blocktext', null: false
      t.boolean 'active', null: false
      t.timestamps
    end
  end
end
