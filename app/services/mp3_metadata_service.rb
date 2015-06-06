class Mp3MetadataService < AbstractMetadataService
  def extract
    metadata = {}

    TagLib::MPEG::File.open(song.file.path) do |file|
      tag = file.tag
      metadata[:title] = tag.title
      metadata[:artist] = tag.artist

      metadata[:cover_art] = cover_art(file.id3v2_tag.frame_list('APIC').first)
    end

    metadata
  end

  private

  def cover_art(frame)
    cover_format = if frame.mime_type == "image/jpeg"
                     ".jpg"
                   else
                     ".png"
                   end

    file = Tempfile.open(['cover_art', cover_format], File.join(Rails.root, 'tmp'))

    file.binmode
    file.write(frame.picture)
    file.close
    file.path
  end
end
