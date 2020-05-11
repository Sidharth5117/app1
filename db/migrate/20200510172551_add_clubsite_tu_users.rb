class AddClubsiteTuUsers < ActiveRecord::Migration[6.0]
  def change
  add_column :users, :club_site, :string
  add_column :users, :club_verified, :boolean, default: false
  end
end
