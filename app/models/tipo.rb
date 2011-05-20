class Tipo < ActiveRecord::Base
	validates :title, :presence=>true
	has_many :derechos
end
