class Music < Que::Job
  @queue = 'music_playing'

  def run(song_id)
    player = Player.find(1)

    unless player.present?
      puts "player not loaded!"
      return
    end

    while !player.playing? do
      puts "Playing is paused, retrying in 10 seconds"
      sleep 10
      player.reload
    end

    song = Song.processed.find song_id
    unless SongPlayerService.play(song, player)
      # this means either the song path is invalid
      # or the afplay process was killed
      #
      # if the afplay process was killed then:
      # 1. requeue
      # 2. sleep for a few seconds

      Music.enqueue song_id
      sleep 5
    end
    puts "Song finished"
  end
end
