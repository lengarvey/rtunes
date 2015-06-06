class Song < ActiveRecord::Base
  mount_uploader :file

  scope :processed, -> { where(processed: true) }
  scope :unprocessed, -> { where(processed: false) }

  validates :title, presence: true, if: :processed

  def mp3?
    !!file.path.match(/mp3\Z/)
  end
end
