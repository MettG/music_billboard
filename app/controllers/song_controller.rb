class SongController < ApplicationController
	before_action :set_song, except: [:index,:new, :create]
	before_action :set_artist
	def index
		@songs = @artist.songs
	end
	def show
	end
	def new
		@song = Song.new
	end
	def create
		@song = @artist.songs.new(song_params)
		if @song.save
			redirect_to @artist
		else
			render :new
		end
	end
	def edit
	end
	def update
		if @song.update(song_params)
			redirect_to artist_song_path(@artist,@song)
		else
			render :edit
		end
	end
	def destroy
		@song.destroy
		redirect_to @artist
	end
	private
		def set_song
			@song = Song.find(params[:id])
		end
		def set_artist
			@artist = Artist.find(params[:artist_id])
		end
		def song_params
			params.require(:song).permit(:name,:genre,:length,:year)
		end
end
