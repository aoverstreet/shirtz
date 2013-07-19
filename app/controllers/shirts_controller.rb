class ShirtsController < ApplicationController

	  before_action :load_shirt, only: [:edit, :update, :show, :destroy]

	def index
		#render :text => "Something Simple"
		
		#shows all shirts
		#@shirts = Shirt.all
		
		#not great for search
		#@shirts = Shirt.where(:name => params[:query])
		
		#@shirts = Shirt.where("name LIKE :query", query: "%#{params[:query]}%")
		
		#much easier
		@shirts = Shirt.search_for(params[:query])
		
	end
	
	def show
	end
	
	def new
		@shirt = Shirt.new
	end
	
	def edit
	end
	
	def update
		#load_shirt
		@shirt.update shirt_params
		
		#try and save
		if @shirt.save
			redirect_to @shirt
		else
			render :edit
		end
	end
	
	
	
	def create
		@shirt = Shirt.new(shirt_params)
		
		#try and save
		if @shirt.save
			redirect_to @shirt
		else
			render :new 
		end

	end
	
	def destroy
		
		
 	
	
		if @shirt.destroy
			flash[:notice] = "The '#{@shirt.name}' shirt has been removed. "
			redirect_to shirts_path
		else
			redirect_to @shirt
		end
	
	end
	
	private
	
	def load_shirt
		@shirt = Shirt.find(params[:id])
	end
	
	#require that they have a shirt and get these attributes
	def shirt_params
		params.require('shirt').permit(:name, :description, :image)
	end
	

end
