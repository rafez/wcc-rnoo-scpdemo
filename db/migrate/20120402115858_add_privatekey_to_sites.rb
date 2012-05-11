class AddPrivatekeyToSites < ActiveRecord::Migration
  def change
    add_column :sites, :privatekey, :string

    add_column :sites, :add_privatekeypw_to_sites, :string

    add_column :sites, :privatekeypw, :string

  end
end
