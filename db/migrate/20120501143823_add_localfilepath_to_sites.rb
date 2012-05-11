class AddLocalfilepathToSites < ActiveRecord::Migration
  def change
    add_column :sites, :localfilepath, :string

  end
end
