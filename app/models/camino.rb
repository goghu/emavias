class Camino < ApplicationRecord
  belongs_to :ruta, optional: true
  belongs_to :unidade, optional: true
  belongs_to :user, optional: true
end
