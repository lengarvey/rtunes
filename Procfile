web:            bundle exec rails server -b 0.0.0.0
play_music:     QUE_WORKER_COUNT=1 QUE_QUEUE=music_playing rake que:work
process_songs:  QUE_WORKER_COUNT=3 QUE_QUEUE=song_processing bundle exec rake que:work
