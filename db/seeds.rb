100.times do
	name = Faker::Music.band
	if rand(2) == 1
		name = Faker::TvShows::BojackHorseman.character
	end
	artist = Artist.create(name: name)
	5.times do
		artist.songs.create(
			name: Faker::Games::LeagueOfLegends.masteries,
			genre: Faker::Music.genre,
			length: rand(60..300),
			year: rand(1900..2020)
		)
	end
end

puts "100 artists seeded with 5 songs each."