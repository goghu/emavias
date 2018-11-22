class Derivacione < ApplicationRecord
  belongs_to :user, class_name: "User", foreign_key: "usero_id", optional: true
end
