class QueuesController < ApplicationController
  def show

  end

  def create
    @song = Song.processed.find(params[:song_id])
  end
end
