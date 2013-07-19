class Shirt < ActiveRecord::Base

	#validation
	validates :name, :description, :image,  presence: true
	validates  :name, :description, length: {minimum: 10} 
	#validates :image, format: 
	
	
	def self.search_for(query)
		Shirt.where("name LIKE :query OR description LIKE :query", query: "%#{query}%")
	end

end
