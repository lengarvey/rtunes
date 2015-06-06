class SongMetadataService < AbstractMetadataService
  def extract
    store metadata_service.extract(@song)
  end

  private

  def store(metadata)
    song.update!(metadata.slice(:title, :artist).merge(processed: true))
  end

  def metadata_service
    if song.mp3?
      Mp3MetadataService
    else
      M4aMetadataService
    end
  end
end
