class Docderivacione < ApplicationRecord
  belongs_to :camino, optional: true
  belongs_to :derivacione, optional: true
end
