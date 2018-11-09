class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	# validates_uniqueness_of :nit, :message => 'El Nit ya ha sido registrado', :allow_blank => true, :allow_nil => true
	attr_accessor :contra2
	before_save :encrypt_password
	def encrypt_password
		if contra2.present?
			self.password_salt = BCrypt::Engine.generate_salt
			self.password_hash = BCrypt::Engine.hash_secret(contra2, password_salt)
		end
	end
end
