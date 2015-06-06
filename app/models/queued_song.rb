# this is kind of horrible
class QueuedSong < ActiveRecord::Base
  self.table_name = "que_jobs"
  default_scope { where("job_class = 'Music'") }

  def song
    Song.find(args.first)
  end
end
