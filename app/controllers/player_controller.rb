class PlayerController < ApplicationController
  def play
    @player.update(playing: true)

    redirect_to :back
  end

  def stop
    @player.update(playing: false)
    system('killall', 'afplay') # yes this is awful

    redirect_to :back
  end
end
