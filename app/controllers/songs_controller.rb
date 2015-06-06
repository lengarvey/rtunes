class SongsController < ApplicationController
  def index
    @songs = Song.processed
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.create(song_params)

    if @song.persisted?
      ProcessSong.enqueue @song.id

      redirect_to songs_path, notice: 'Song added for processing'
    else
      flash.now.alert = "Song not added"
      render :new
    end
  end

  private

  def song_params
    params.require(:song).permit(:file)
  end
end
