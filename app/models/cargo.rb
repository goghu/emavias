class Cargo < ApplicationRecord
  belongs_to :unidade, optional: true
end
