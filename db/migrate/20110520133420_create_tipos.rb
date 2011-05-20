class CreateTipos < ActiveRecord::Migration
  def self.up
    create_table :tipos do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :tipos
  end
end
