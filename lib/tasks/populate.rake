namespace :db do
	desc "Erase and fill database"

	task :populate => :environment do
		require "populator"
		
		[User, Admin, Tipo].each(&:delete_all)

		User.populate 1 do |user|
			user.email = "a@a.a"
      user.password_salt = BCrypt::Engine.generate_salt
      user.password_hash = BCrypt::Engine.hash_secret("cool", user.password_salt)
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
			end
		end
	end
end
				
