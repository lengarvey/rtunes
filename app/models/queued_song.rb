class QueuedSong < ActiveRecord::Base
  belongs_to :song
  validates :song_id, uniqueness: true

  def self.up_next
    unplayed.order(:created_at).limit(1).first || RandomSong.new
  end

  def mark_as_played
    destroy
  end
end
