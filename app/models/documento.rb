class Documento < ApplicationRecord
	belongs_to :remi, class_name: "User", foreign_key: "remitente", optional: true
end
