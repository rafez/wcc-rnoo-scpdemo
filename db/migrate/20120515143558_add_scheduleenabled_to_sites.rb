class AddScheduleenabledToSites < ActiveRecord::Migration
  def change
    add_column :sites, :scheduleenabled, :boolean

  end
end
