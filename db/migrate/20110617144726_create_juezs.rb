class CreateJuezs < ActiveRecord::Migration
  def self.up
    create_table :juezs do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :juezs
  end
end
