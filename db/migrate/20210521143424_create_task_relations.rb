class CreateTaskRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :task_relations do |t|
      t.references :parent, foreign_key: { to_table: :tasks }
      t.references :child, foreign_key: { to_table: :tasks }

      t.timestamps
    end
  end
end
