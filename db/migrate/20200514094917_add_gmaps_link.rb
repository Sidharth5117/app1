class AddGmapsLink < ActiveRecord::Migration[6.0]
  def change
  add_column :events, :gmaps_link, :string
  end
end
