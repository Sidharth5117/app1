class Addclubnametousers < ActiveRecord::Migration[6.0]
  def change
   add_column :users, :club_name, :string
  end
end
