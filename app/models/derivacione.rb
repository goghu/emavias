class Derivacione < ApplicationRecord
  belongs_to :user_o, class_name: "User", foreign_key: "usero_id", optional: true
  belongs_to :user_d, class_name: "User", foreign_key: "userd_id", optional: true
  belongs_to :unidad_o, class_name: "Unidade", foreign_key: "unidadeo_id", optional: true
  belongs_to :unidad_f, class_name: "Unidade", foreign_key: "unidadd_id", optional: true
  # belongs_to :compra, class_name: "Compra", foreign_key: "compra_id", optional: true
  belongs_to :compra, optional: true
end
