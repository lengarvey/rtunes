require 'tempfile'

class M4aMetadataService < AbstractMetadataService
  def extract
    metadata = {}
    TagLib::MP4::File.open(song.file.path) do |mp4|
      item_list_map = mp4.tag.item_list_map
      metadata[:title] = title(item_list_map)
      metadata[:artist] = artist(item_list_map)
      metadata[:cover_art] = cover_art(item_list_map)
    end

    metadata
  end

  private

  # the stuff inside the m4a item list is bananas
  #
  # "aART"
  # "apID"
  # "atID"
  # "cnID"
  # "covr"
  # "cpil"
  # "disk"
  # "geID"
  # "ownr"
  # "pgap"
  # "plID"
  # "purd"
  # "rtng"
  # "sfID"
  # "soal"
  # "soar"
  # "soco"
  # "sonm"
  # "stik"
  # "trkn"
  # "xid "
  # "©ART"
  # "©alb"
  # "©day"
  # "©gen"
  # "©nam"
  # "©wrt"
  def artist(item_list)
    fetch_item_string(item_list, "aART", "\xC2\xA9ART")
  end

  def title(item_list)
    fetch_item_string(item_list, "\xC2\xA9nam")
  end

  def cover_art(item_list)
    cover_art_list = item_list['covr'].to_cover_art_list
    cover_art = cover_art_list.first

    cover_format = if cover_art.format == TagLib::MP4::CoverArt::JPEG
                     ".jpg"
                   else
                     ".png"
                   end

    file = Tempfile.open(['cover_art', cover_format], File.join(Rails.root, 'tmp'))

    file.binmode
    file.write(cover_art.data)
    file.close
    file.path
  end

  def fetch_item_string(item_list, *key_names)
    good_key = key_names.find { |k| item_list[k].present? }

    item = item_list[good_key]

    if item.present?
      item.to_string_list.first
    end
  end
end
