class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.string :password_digest
      t.integer :access
      t.integer :date_last_visited
      t.integer :bann

      t.timestamps null: false
    end
  end
end
