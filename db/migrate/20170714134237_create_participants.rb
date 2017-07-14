class CreateParticipants < ActiveRecord::Migration[5.1]
  def change
    create_table :participants do |t|
      t.string :code
      t.references :event, foreign_key: true
      t.references :user, foreign_key: true
      t.text :comments

      t.timestamps
    end
  end
end
