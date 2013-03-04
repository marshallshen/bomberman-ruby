# Bomberman

This is a ruby client gem for the Bomberman HTTP API. It has been built
and tested against Ruby 1.9.3.

[Bomberman](http://addons.heroku.com/bomberman): shelter from profanity bombing, is an [add-on](http://addons.heroku.com) for Heroku
applications. If you would like to be part of the alpha or early beta
testing process please email <bomberman-support@ikayzo.com>.

For detailed instructions on installing the addon to your Heroku
application please see our [add-on documentation page](https://github.com/ikayzo/bomberman/issues)

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

    :::ruby
    non_profane_text = "The quick brown fox jumped over the lazy dog."
    Bomberman::Profanity.censor(non_profane_text, "####")
      #=> "The quick brown fox jumped over the lazy dog."
    profane_text = "The quick brown fox jumped over the F-BOMBing lazy dog."
    Bomberman::Profanity.censor(profane_text, "####")
      #=> "The quick brown fox jumped over the ### lazy dog."

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

## Dashboard

The Bomberman dashboard allows you to tailor your profanity shelter to
your specific needs. From here you can choose what specific words or
phrases you want to block or allow through.

![Bomberman Heroku Dashboard](http://bomberman.s3.amazonaws.com/heroku_dashboard_preview.png)

The dashboard can be accessed via the CLI:

    :::term
    $ heroku addons:open bomberman
    Opening bomberman for drunken-tyrion-4005…

or by visiting the [Heroku apps web interface](http://heroku.com/myapps) and selecting the application. Select Bomberman from the Add-ons menu.

### Allowed Phrases

These are phrases that include one or more words that by themselves
would be considered profane, but strung together they compose a phrase
you would like to allow through your shelter. *Allowed Phrases* must contain more
than one word (non whitespace characters separated by a space).

### Blocked Phrases

Just because a phrase does not include profanity does not mean that it isn't
offensive to your users.  Here you can beef up your shelter with specifc
phrases your targeted demographic might not like to see in your content.
*Blocked Phrases* must contain more than one word (non whitespace characters
separated by a space).

### Blocked Words

Adds custom protection to your shelter just like *Blocked Phrases* but
for single words (cannot contain whitespace).

## Troubleshooting

We are just starting out.  If you experience trouble please contact us
at <bomberman-support@ikayzo.com>.

## Support

All Bomberman support and runtime issues should be submitted via email
to <bomberman-support@ikayzo.com>.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
