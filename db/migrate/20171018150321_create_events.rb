class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :name
      t.string :url
      t.string :date
      t.string :description
      t.string :month
      t.timestamps
    end
  end
end
