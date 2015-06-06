class QueuesController < ApplicationController
  def show
    @queued_songs = QueuedSong.all.map(&:song)
  end

  def create
    @song = Song.processed.find(params[:song_id])
    Music.enqueue @song.id

    redirect_to root_path, notice: "#{@song.title} queued"
  end
end
