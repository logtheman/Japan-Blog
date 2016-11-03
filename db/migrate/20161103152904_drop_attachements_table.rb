class DropAttachementsTable < ActiveRecord::Migration
  def up
    drop_table :attachements
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
