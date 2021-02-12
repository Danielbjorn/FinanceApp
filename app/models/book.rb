

class Book < ApplicationRecord

	belongs_to :user # Daniel 

	#has_attached_file :image, :styles => { :medium => "300x300", :thumb => "100x100" } # Daniel -- look through paperclick documentation
	#validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]



	has_one_attached :image
	has_one_attached :testfile
	validates :image, content_type: [:png, :jpg, :jpeg]

end

			# ----------- can be used to set user avatar ! ------------------- 
			#:default_url => "/images/default_:style_avatar.png" 