class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :title
      t.string :email, null: false
      t.string :password_digest, null: false
      t.integer :role, null: false
      t.integer :work_focus
      t.integer :status

      t.timestamps
    end
  end
end
