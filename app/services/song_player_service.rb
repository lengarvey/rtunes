class SongPlayerService
  def self.play(song)
    if song.present?
      path = song.file.path
      puts "Now playing: #{path}"

      system 'afplay', path
    else
      puts "Cannot load song: #{song_id}"
    end
  end
end
