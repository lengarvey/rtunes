class SongsController < ApplicationController
  def index
    @songs = Song.processed
  end

  def new
    @song = Song.new
  end

  def create
    # this is a pretty awful hack to create lots of songs with one request
    add_songs

    redirect_to songs_path, notice: 'Songs added for processing'
  end

  private

  def song_params
    params.require(:song).permit(file: [])
  end

  def add_songs
    song_params[:file].each do |song_file|
      song = Song.create(file: song_file)
      ProcessSong.enqueue song.id if song.persisted?
    end
  end
end
