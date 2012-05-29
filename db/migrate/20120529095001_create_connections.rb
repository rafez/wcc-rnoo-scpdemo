class CreateConnections < ActiveRecord::Migration
  def change
    create_table :connections do |t|
      t.string :name
      t.string :servername
      t.string :ipaddress
      t.text :description
      t.string :privatekeypw
      t.text :privatekey

      t.timestamps
    end
  end
end
