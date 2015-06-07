class SongPlayerService
  def self.play(song, player, random: false)
    if song.present?
      player.update(song: song)
      path = song.file.path
      puts "Now playing: #{song.title}"

      system('afplay', path) # returns false on non-zero exit
    else
      puts "Cannot load song: #{song_id}"
      true # return instead of nil so that the job can recover properly
    end
  end
end
