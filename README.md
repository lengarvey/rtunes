A simple app for playing shared music at events
===============================================

1. Upload music (that you have the rights to share/play).
2. Queue music.
3. When the queue finishes, random music will play.

Doesn't screw around with itunes at all because that's super difficult.

Designed for #railscamp 17

## System requirements

1. A Mac - it shells out to `afplay` in the background because I'm terrible.
2. Ruby and Rails.
3. Speakers to listen to your rad music.

## Data model

    Tune.enqueue #=> win
