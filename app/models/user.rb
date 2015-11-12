class User < ActiveRecord::Base

	has_secure_password

	has_many :event_entries
	has_many :events, :through => :event_entries, dependent: :delete_all

	GENDER_TYPES = ["Not Telling", "Male", "Female"]

	EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i

	validates :name, presence: true, :length => { :maximum => 150 }
	validates :email, presence: true, uniqueness: true, :length => { :maximum => 100 }, :format => EMAIL_REGEX, confirmation: true
	validates :password, length: { minimum: 6 }
end
