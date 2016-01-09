class Post < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	has_many :photos

	validate :title, presence => true, length: { minimun: 3 }
	
	validate :description, presence => true
end
