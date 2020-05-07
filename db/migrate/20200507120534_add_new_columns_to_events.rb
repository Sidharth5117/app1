class AddNewColumnsToEvents < ActiveRecord::Migration[6.0]
  def change
add_column :events, :event_name, :text
add_column :events, :event_date, :text
add_column :events, :event_time, :text
add_column :events, :proof, :text
add_column :events, :add_info, :text
  end
end
