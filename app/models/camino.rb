class Camino < ApplicationRecord
  belongs_to :ruta, optional: true
  belongs_to :unidade, optional: true
end
