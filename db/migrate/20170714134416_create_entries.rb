class CreateEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :entries do |t|
      t.integer :order_no
      t.references :song, foreign_key: true
      t.references :event, foreign_key: true
      t.references :participant, foreign_key: true
      t.boolean :break_flag, default: false

      t.timestamps
    end
  end
end
