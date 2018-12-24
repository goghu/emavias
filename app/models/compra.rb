class Compra < ApplicationRecord
  has_many :item
  belongs_to :user, optional: true
end
