class RandomSong
  def song
    @song ||= Song.processed.sample
  end

  def mark_as_played
  end
end
