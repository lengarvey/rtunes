class Music < Que::Job
  @queue = 'music_playing'

  def run(song_id)
    song = Song.processed.find song_id
    SongPlayerService.play(song)
  end
end
