class CreateDerechos < ActiveRecord::Migration
  def self.up
    create_table :derechos do |t|
      t.string :title
      t.text :description
      t.references :tipo

      t.timestamps
    end
  end

  def self.down
    drop_table :derechos
  end
end
