:musical_note::musical_note::musical_note::musical_note::musical_note: A simple app for playing shared music at events :musical_note::musical_note::musical_note::musical_note::musical_note:
===============================================

Upload and queue music to play on a server. Suitable for private functions
like lanparties or railscamps etc. Doesn't stream music, literally plays music
on a Mac server.

1. Upload music (that you have the rights to share/play).
2. Queue music.
3. When the queue finishes, random music will play.

Doesn't screw around with itunes at all because that's super difficult.

Designed for #railscamp 17

## System requirements

1. A Mac - it shells out to `afplay` in the background because I'm terrible.
2. Ruby and Rails.
3. taglib (`brew install taglib`)
4. postgres (`brew install postgresql`)
5. Speakers to listen to your rad music.
6. foreman (`gem install foreman`)

## Starting the :musical_note::musical_note::musical_note::musical_note::musical_note:

1. Clone this repo
2. `bundle install`
3. `rake db:create db:migrate` (you might need to futz around with `config/database.yml`)
4. `foreman start`

## TODO

1. Make the UI heaps nicer.
2. ~~Allow multiple songs to be uploaded at once.~~
3. ~~Allow the songs to be stopped using the UI.~~
4. When the server boots, do a check to see that there is a Music job queued.
4. Song searching.
5. If there's a binary like `afplay` on linux or something that could be a thing.
6. Explore discovering songs on a local network using bonjour or something clever.

## Disclaimer and License

License: MIT

Don't use this to do illegal things like playing or sharing music you don't have the rights to.
