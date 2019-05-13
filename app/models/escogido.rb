class Escogido < ApplicationRecord
	belongs_to :user, optional: true
end
