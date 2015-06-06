class AbstractMetadataService
  def self.extract(song)
    new(song).extract
  end

  attr_reader :song

  def initialize(song)
    @song = song
  end

  def extract
  end
end
