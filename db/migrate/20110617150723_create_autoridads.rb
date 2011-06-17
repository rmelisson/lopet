class CreateAutoridads < ActiveRecord::Migration
  def self.up
    create_table :autoridads do |t|
      t.string :name
      t.references :juez

      t.timestamps
    end
  end

  def self.down
    drop_table :autoridads
  end
end
