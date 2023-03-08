class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.text :caption, null: false
      t.integer :comments_count, default: 0
      t.references :owner, null: false, foreign_key: { to_table: :users }, index: true
      t.string :status, default: "backlog"

      t.timestamps
    end
  end
end
