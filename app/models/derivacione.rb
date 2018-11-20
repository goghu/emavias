class Derivacione < ApplicationRecord
  belongs_to :cuser, class_name: "User", foreign_key: "cliente", optional: true
end
