# Bomberman

This is a ruby client gem for the Bomberman HTTP API. It has been built
and tested against Ruby 1.9.3.

[Bomberman](http://addons.heroku.com/bomberman): shelter from profanity bombing, is an [add-on](http://addons.heroku.com) for Heroku
applications. If you would like to be part of the alpha or early beta
testing process please email <bomberman-support@ikayzo.com>.

For detailed instructions on installing the addon to your Heroku
application please see our [add-on documentation
page](http://bomberman.ikayzo.com/)

## Using with Rails 3.x

We developed a ruby client gem for making requests to the
Bomberman API.

Ruby on Rails applications will need to add the following entry into their `Gemfile` specifying the Bomberman client library.

```ruby
gem 'bomberman'
```

Update application dependencies with bundler.

```term
$ bundle install
```

Now create an initializer file `config/initializers/bomberman.rb` with
your `BOMBERMAN_API_KEY`

```ruby
Bomberman.configure do |config|
  config.api_key = ENV['BOMBERMAN_API_KEY']
end
```
From here you can call the Bomberman::Profanity functionality within
your application.

### Checking if Text Contains Profanity

To check if a piece of text or *corpus* contains profanity use the
`.profane?(corpus)` method.  This will return a boolean value as the
result

```ruby
non_profane_text = "The quick brown fox jumped over the lazy dog."
Bomberman::Profanity.profane?(non_profane_text)
  #=> false
profane_text = "The quick brown fox jumped over the F-BOMBing lazy dog."
Bomberman::Profanity.profane?(profane_text)
  #=> true
```
    
### Censoring Profane Words & Phrases

If you would like to save or display text where the profane words (if
any) are obfuscated the `.censor(corpus, replacement_text)` method is
what you are looking for.

```ruby
non_profane_text = "The quick brown fox jumped over the lazy dog."
Bomberman::Profanity.censor(non_profane_text, "####")
  #=> "The quick brown fox jumped over the lazy dog."
profane_text = "The quick brown fox jumped over the F-BOMBing lazy dog."
Bomberman::Profanity.censor(profane_text, "####")
  #=> "The quick brown fox jumped over the ### lazy dog."
```

The `replacement_text` parameter is a string and optional. `"***"` is
suppled by default.

### Highlighting Profane Words & Phrases

Sometimes it is useful to leave the original profane word/phrase intact
but wrap it in some sort of tag to make it stand out. This can be
accomplished with the `.highlight(corpus, start_tag, end_tag)` method.

```ruby
non_profane_text = "The quick brown fox jumped over the lazy dog."
BomberMan::Profanity.highlight(non_profane_text, "<blink>", "</blink>")
  #=> "The quick brown fox jumped over the lazy dog."
profane_text = "The quick brown fox jumped over the F-BOMBing lazy dog."
BomberMan::Profanity.highlight(profane_text, "<blink>", "</blink>")
  #=> "The quick brown fox jumped over the <blink>F-BOMBing</blink> lazy dog."
```

The `start_tag` & `end_tag` parameters are strings and optional. A pair
of opening and closing `<span>` tags are used if none are provided.

## Troubleshooting

We are just starting out.  If you experience trouble please contact us
at <bomberman-support@ikayzo.com>.

## Contributing

Given the early stage of this project we are open to comments &
suggestions for this library please send them to <bomberman-support@ikayzo.com>.
