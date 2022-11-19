class DropRegistrationsTable < ActiveRecord::Migration[6.1]
  def up
    drop_table :registrations
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
  
end
