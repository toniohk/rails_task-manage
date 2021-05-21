class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :description
      t.integer :work_focus
      t.date :due_date
      t.integer :status
      t.references :parent, null: false, foreign_key: { to_table: :tasks }
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
