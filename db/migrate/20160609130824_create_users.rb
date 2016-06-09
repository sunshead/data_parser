class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, :limit => 25
      t.string :password, :limit => 25
      t.string :email, :default => "", :null => true

      t.timestamps null: false
    end
  end
end
