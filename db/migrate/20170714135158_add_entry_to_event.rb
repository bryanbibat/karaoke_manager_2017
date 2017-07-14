class AddEntryToEvent < ActiveRecord::Migration[5.1]
  def change
    add_reference :events, :entry, foreign_key: true
  end
end
