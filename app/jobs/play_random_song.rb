class PlayRandomSong < Que::Job
  @priority = 200 # lower numbers have higher priority. 100 is default.
  @queue = 'music_playing'

  def run
    song = Song.processed.sample

    SongPlayerService.play(song)
    PlayRandomSong.enqueue
  end
end
