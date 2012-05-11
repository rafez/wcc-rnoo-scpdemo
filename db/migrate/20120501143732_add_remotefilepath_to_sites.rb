class AddRemotefilepathToSites < ActiveRecord::Migration
  def change
    add_column :sites, :remotefilepath, :string

  end
end
