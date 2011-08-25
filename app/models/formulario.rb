class Formulario < ActiveRecord::Base
	validates :derecho, :presence=>true
	validates :title, :presence=>true
	has_many :accions
  belongs_to :derecho
end
