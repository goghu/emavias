class Documento < ApplicationRecord
	belongs_to :remitente, class_name: "User", foreign_key: "remitente", optional: true
end
