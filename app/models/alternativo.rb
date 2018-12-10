class Alternativo < ApplicationRecord
	belongs_to :camino, optional: true
	belongs_to :alternativo, class_name: "Ruta", foreign_key: "alternativo_id", optional: true
	belongs_to :ruta, class_name: "Ruta", foreign_key: "ruta_id", optional: true
end
