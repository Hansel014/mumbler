class Post < ActiveRecord::Base
	belongs_to :user
	has_many :comments

	scope :created_before, ->(time) { where("created_at < ?", time) }
	validates :body, length: {in: 5..7000}

	def display_status
		if self.status == 0
			"closed"
		elsif self.status == 1
			"open"
		elsif self.status == 2
			"pending"
		else
			"not set"
		end
	end

end