class Song < ActiveRecord::Base
  mount_uploader :file
  mount_uploader :cover

  scope :processed, -> { where(processed: true) }
  scope :unprocessed, -> { where(processed: false) }

  validates :title, presence: true, if: :processed
  validates :artist, presence: true, if: :processed

  def mp3?
    !!file.path.match(/mp3\Z/)
  end
end
