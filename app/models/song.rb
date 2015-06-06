class Song < ActiveRecord::Base
  mount_uploader :file
  mount_uploader :cover

  scope :processed, -> { where(processed: true) }
  scope :unprocessed, -> { where(processed: false) }

  validates :title, presence: true, if: :processed
  validates :artist, presence: true, if: :processed

  validates_uniqueness_of :md5hash, on: :create

  # I kinda don't like callbacks
  before_validation :compute_hash

  def compute_hash
    self.md5hash = Digest::MD5.hexdigest(file.read) if md5hash.blank?
  end

  def mp3?
    !!file.path.match(/mp3\Z/)
  end
end
