namespace :db do
	desc "Erase and fill database"

	task :populate => :environment do
		require "populator"
		
		[User, Admin].each(&:delete_all)

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
	end
end
				
