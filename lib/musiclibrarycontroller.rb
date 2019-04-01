
class MusicLibraryController
  
  def initialize(path="./db/mp3s")
    importer=MusicImporter.new(path)
    importer.import
  end
  
  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    command=""
    while command !="exit"
      puts "What would you like to do?"
      command=gets.strip
    end
  end
  
  def list_songs
    list=Song.all.uniq.sort_by{|song| song.name}
    #binding.pry
    list.each_with_index{|song, i|
      line="#{i+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      puts line
    }
  end
  
  def list_artists
    artists=[]
    Song.all.each{|song| artists << song.artist.name}
    artists.uniq.sort.each_with_index{|artist, i|
     binding.pry
      line="#{i+1}. #{artist}"
      puts line
    }
    
  end
  
end

