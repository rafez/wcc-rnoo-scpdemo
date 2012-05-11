class CreateMigrations < ActiveRecord::Migration
  def change
    create_table :migrations do |t|
      t.string :add_sitename_to_sites
      t.string :sitename

      t.timestamps
    end
  end
end
