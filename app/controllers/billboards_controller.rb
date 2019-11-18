class BillboardsController < ApplicationController
	before_action :set_billboard, except: [:index, :new, :create]
	def index
		@billboards = Billboard.all
  end

  def show
	
	end

  def new
		@billboard = Billboard.new
	end

  def create
		@billboard = Billboard.new(billboard_params)
		if @billboard.save
			redirect_to @billboard
		else
			render :new
		end
	end

  def edit
		
	end

  def update
		if @billboard.update(billboard_params)
			redirect_to @billboard
		else
			render :edit
		end
	end

  def destroy
		@billboard.songs.destroy_all
		@billboard.destroy
		redirect_to billboards_path
	end

	def populate
		@billboard.populate
		redirect_to @billboard
	end
	private
		def set_billboard
			@billboard = Billboard.find(params[:id])
		end

		def billboard_params
			params.require(:billboard).permit(:name)
		end
	
end
