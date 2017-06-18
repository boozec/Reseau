class CreateUsers < ActiveRecord::Migration[5.1]
  def up
    create_table :users do |t|
      t.string 'nickname', :limit => 15, :null => false
      t.string 'password', :limit => 60, :null => false
      t.string 'email', :limit => 30, :null => false
      t.integer 'rank'
      t.string 'reg_ip', :limit => 30, :null => false
      t.string 'last_ip', :limit => 30, :null => false
      t.string 'startcode', :limit => 60, :null => false
      t.timestamps
  end

  def down
    drop_table :users
  end
end
