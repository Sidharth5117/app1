class AddCatidToEvents < ActiveRecord::Migration[6.0]
  def change
  add_column :events, :category_id, :integer
  end
end
