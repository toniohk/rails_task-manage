class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :title
      t.string :email
      t.string :password
      t.integer :role
      t.integer :work_focus
      t.integer :status

      t.timestamps
    end
  end
end
