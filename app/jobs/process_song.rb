class ProcessSong < Que::Job
  def run(song_id)
    song = Song.find song_id

    if song.present?
      SongMetadataService.extract(song)
    end
  end
end
