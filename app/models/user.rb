class User < ActiveRecord::Base
	validates :name, presence: true, uniqueless: true
  has_secure_password
end
