class Customer < ActiveRecord::Base
	has_many 	:invoices
	validates :fname, presence: true
	validates :lname, presence: true
	validates :email, presence: true
	validates :companyName, presence: true

	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

end
