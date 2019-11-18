class Billboard < ApplicationRecord
	has_many :songs
	def populate(songs=Song.all)
		songs_without = []
		songs.each do |s|
			if s.billboard_id == nil
				songs_without.push(s)
			end
		end

		@number = 0
		case rand(3)
		when 0
			@number = 50
		when 1
			@number = 25
		when 2
			@number = 100
		end
		@number.times do
			if songs_without.length == 0
				break
			end
			song = songs_without[rand(songs_without.length)]
			song.billboard_id = self.id
			song.save
			songs_without -= [song]
		end
		self.name+=" #{@number}"
		self.save
	end
end
