class QueuesController < ApplicationController
  before_action :queued_songs

  def show
  end

  def create
    @song = Song.processed.find(params[:song_id])

    notice = if song_in_queue?
      "#{@song.title} already in queue"
    else
      Music.enqueue @song.id
      "#{@song.title} queued"
    end

    redirect_to root_path, notice: notice
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
