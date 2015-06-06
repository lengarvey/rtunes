class Music < Que::Job
  def run(song_id)
    song = Song.processed.find song_id

    if song.present?
      path = song.file.path
      puts "Now playing: #{path}"

      system 'afplay', path
    else
      puts "Cannot load song: #{song_id}"
    end
  end
end
