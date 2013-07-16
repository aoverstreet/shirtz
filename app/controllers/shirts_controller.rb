class ShirtsController < ApplicationController

	def index
		#render :text => "Something Simple"
		
		#shows all shirts
		#@shirts = Shirt.all
		
		#not great for search
		#@shirts = Shirt.where(:name => params[:query])
		
		#@shirts = Shirt.where("name LIKE :query", query: "%#{params[:query]}%")
		
		@shirts = Shirt.search_for(params[:query])
		
	end

end
