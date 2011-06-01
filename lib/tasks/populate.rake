namespace :db do
	desc "Erase and fill database"

	task :populate => :environment do
		require "populator"
		
		[User, Admin, Tipo, Formulario, Accion].each(&:delete_all)

		i = 1
		User.populate 2 do |user|
			user.email = i.to_s + "@a.a"
      user.password_salt = BCrypt::Engine.generate_salt
      user.password_hash = BCrypt::Engine.hash_secret("cool", user.password_salt)
			i += 1
		end

		Admin.populate 1 do |admin|
			admin.login = "remi"
      admin.password_salt = BCrypt::Engine.generate_salt
      admin.password_hash = BCrypt::Engine.hash_secret("cool", admin.password_salt)
		end	

		Tipo.populate 5 do |tipo|
      tipo.title = Populator.words(1..5).titleize
      tipo.description = Populator.sentences(1)
			Derecho.populate 1..4 do |derecho|
				derecho.tipo_id = tipo.id
				derecho.title = Populator.words(1..5).titleize
      	derecho.description = Populator.sentences(1)
				Formulario.populate 1..5 do |formulario|
					formulario.derecho_id = derecho.id
					formulario.title = Populator.words(1..5).titleize
					formulario.description = Populator.sentences(1)
					formulario.arguments = Populator.sentences(3..10)
				end
			end
		end

		Accion.populate 1 do |accion|
			accion.hechos = Populator.sentences(3..6)
			accion.user_id = 1 
			accion.formulario_id = 3
		end

	end
end
				
