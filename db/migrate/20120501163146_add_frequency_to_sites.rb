class AddFrequencyToSites < ActiveRecord::Migration
  def change
    add_column :sites, :frequency, :integer

  end
end
