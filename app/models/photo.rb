class Photo < ActiveRecord::Base
	belongs_to :post
	belongs_to :user


	 mount_uploader :picture, PictureUploader  

      
      
     
end
