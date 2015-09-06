# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
# Creating albums
albums = Album.create([ {title: "Bump 15", year: 2005},{title: "Hits 2010", year: 2010}, {title: "Last Dance", year: 2013}])

# Creating tracks
tracks = Track.create([ {title: "Track 1", year: 2007, genre: "house", number: 1}, {title: "Track 2", year: 2007, genre: "house", number: 2}])

# Creating artist
artist = Artist.create([ {firstname: 'Tshepiso', lastname: 'Tsotetsi', aka: 'djtsheps'} ])

# Adding ablum to each track
tracks.first.albums << albums.first
tracks.first.albums << albums.last
tracks.last.albums << albums.second

# Adding artist to each track
tracks.first.artists << artist.first
tracks.last.artists << artist.first
