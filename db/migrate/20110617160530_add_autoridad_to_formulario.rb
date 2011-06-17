class AddAutoridadToFormulario < ActiveRecord::Migration
  def self.up
    # we add a foregin key (in the sqlite way...)
    execute <<-SQL
      ALTER TABLE formularios RENAME TO formularios_backup;
			CREATE TABLE formularios(
				id						INTEGER PRIMARY KEY,
				title					STRING,
				description		TEXT,
				arguments			TEXT,
				derecho_id		INTEGER,
				FOREIGN KEY(derecho_id) REFERENCES derechos(id),
				autoridad_id	INTEGER,
				FOREIGN KEY(autoridad_id) REFERENCES autoridad_id(id),
				created_at		DATETIME,
				updated_at		DATETIME
			);
			INSERT INTO formularios SELECT * FROM formularios_backup;
			DROP TABLE formularios_backup;
		SQL
  end

  def self.down
		#execute "ALTER TABLE formularios DROP FOREIGN KEY fk_formularios_autoridads"	
  end
end
