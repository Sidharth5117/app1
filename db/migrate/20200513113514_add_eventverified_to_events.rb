class AddEventverifiedToEvents < ActiveRecord::Migration[6.0]
  def change
   add_column :events, :event_verified, :boolean, default: false
  end
end
