class AddSrcDest < ActiveRecord::Migration
  def change
    rename_column :sites, :username, :src_username
    rename_column :sites, :sitename, :src_sitename
    rename_column :sites, :description, :src_description
    rename_column :sites, :privatekeypw, :src_privatekeypw
    rename_column :sites, :privatekey, :src_privatekey
    rename_column :sites, :localfilepath, :src_filepath
    
    add_column :sites, :dest_username, :string
    add_column :sites, :dest_sitename, :string
    add_column :sites, :dest_description, :string
    add_column :sites, :dest_privatekeypw, :string
    add_column :sites, :dest_privatekey, :string
    add_column :sites, :dest_filepath, :string
    
  end
  
  def up
  end

  def down
  end
end
