class Comment < ActiveRecord::Base
	belogns_to :user
	belogns_to :post
end
