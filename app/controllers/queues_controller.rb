class QueuesController < ApplicationController
  before_action :queued_songs

  def show
  end

  def create
    @song = Song.processed.find(params[:song_id])

    if song_in_queue?
      redirect_to :back, alert: "#{@song.title} already in queue"
    else
      Music.enqueue @song.id
      redirect_to root_path, notice: "#{@song.title} queued"
    end
  end

  private

  # this is so awful, I'm sorry
  def song_in_queue?
    queued_songs.map(&:song).find { |s| s.id == @song.id }
  end

  def queued_songs
    @queued_songs ||= QueuedSong.all
  end
end
