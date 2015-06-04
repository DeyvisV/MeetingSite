class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :start_date
      t.datetime :end_date
      t.string :location
      t.text :agenda
      t.text :address
      t.references :organizer, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
