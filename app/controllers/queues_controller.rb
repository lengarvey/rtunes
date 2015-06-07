class QueuesController < ApplicationController
  before_action :queued_songs, only: [ :show ]

  def show
  end

  def create
    song = Song.processed.find(params[:song_id])

    queued_song = QueuedSong.create(song: song)

    if queued_song.persisted?
      redirect_to root_path, notice: "#{song.title} queued"
    else
      redirect_to :back, alert: "#{song.title} already in queue"
    end
  end

  private

  def queued_songs
    @queued_songs ||= QueuedSong.all
  end
end
