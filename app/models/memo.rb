class Memo < ApplicationRecord
	belongs_to :remitente, class_name: "User", foreign_key: "remitente_id", optional: true
end
