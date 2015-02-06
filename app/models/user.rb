class User < ActiveRecord::Base
	has_many :posts
	has_many :comments
	has_many :active_relationships, class_name: "Relationship",
									foreign_key: "follower_id",
									dependent:  :destroy
	has_many :passive_relationships, class_name: "Relationship",
									 foreign_key: "followed_id",
									 dependent: :destroy
	has_many :following, through: :active_relationships, source: :followed
	has_many :followers, through: :passive_relationships, source: :follower

	has_attached_file :image, styles: {small:"64x64>", med: "100x100",large: "200x200>", icon: "32x32>"}
					  # :url  => "/assets/user/:id/:style/:basename.:extension",
       #                :path => ":rails_root/public/user/images/:id/:style/:basename.:extension"

validates_attachment_presence :image
validates_attachment_size :image, :less_than => 5.megabytes
validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png']



end
	
  
