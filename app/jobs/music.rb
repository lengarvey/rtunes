class Music < Que::Job
  @queue = 'music_playing'

  def run
    player = Player.find(1)

    unless player.present?
      puts "player not loaded!"
      return
    end

    if player.playing?
      queued_song = QueuedSong.up_next

      if SongPlayerService.play(queued_song.song, player)
        queued_song.mark_as_played
      else
        # this means either the song path is invalid
        # or the afplay process was killed
        sleep 5
      end
      puts "Song finished"
    end
    Music.enqueue
  end
end
