class PlayRandomSong < Que::Job
  @priority = 200 # lower numbers have higher priority. 100 is default.
  @queue = 'music_playing'

  def run
    player = Player.find(1)
    puts "New random song!"

    if player.present? && player.playing?
      song = Song.processed.sample

      puts "Randomly playing #{song.title}"
      SongPlayerService.play(song, player, random: true)
      puts "Song finished"
      PlayRandomSong.enqueue
    else
      puts "Player not playing. Not playing a random song"
      PlayRandomSong.enqueue(run_at: 15.seconds.from_now)
    end
  end
end
