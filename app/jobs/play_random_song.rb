class PlayRandomSong < Que::Job
  @priority = 200 # lower numbers have higher priority. 100 is default.
  @queue = 'music_playing'

  def run
    song = Song.all.sample

    SongPlayerService.play(song)
  end

  def destroy
    PlayRandomSong.enqueue
    super
  end
end
