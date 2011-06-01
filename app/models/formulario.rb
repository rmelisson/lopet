class Formulario < ActiveRecord::Base
	has_many :accions
  belongs_to :derecho
end
