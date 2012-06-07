class AddSiteIdToConnection < ActiveRecord::Migration
  def change
    add_column :connections, :site_id, :integer

  end
end
