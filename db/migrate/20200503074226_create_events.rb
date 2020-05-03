class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
    t.string :location
    t.string :long
    t.string :lang
    t.timestamps
    end
  end
end
