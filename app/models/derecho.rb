class Derecho < ActiveRecord::Base
	validates :title, :presence=>true
	validates :tipo, :presence=>true
  belongs_to :tipo
end
