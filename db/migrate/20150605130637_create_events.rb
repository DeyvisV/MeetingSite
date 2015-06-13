class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :start_date
      t.datetime :end_date
      t.string :location
      t.text :agenda
      t.text :address
      t.references :organizer, index: true
      t.timestamps null: false
    end
    add_foreign_key :events, :users, column: :organizer_id
  end
end
