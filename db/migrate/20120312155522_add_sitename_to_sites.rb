class AddSitenameToSites < ActiveRecord::Migration
  def change
    add_column :sites, :sitename, :string

  end
end
