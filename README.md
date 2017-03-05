# key_flatten

Flatten/unflatten keys of `Hash`.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'key_flatten'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install key_flatten

## Usage

### Module function

```rb
require 'key_flatten'

KeyFlatten.key_flatten({"foo" => {"bar" => "baz"}})
# => {"foo.bar" => "baz"}

KeyFlatten.key_unflatten({"foo.bar" => "baz"})
# => {"foo" => {"bar" => "baz"}}
```

### Monkey patching

```rb
require 'key_flatten/core_ext'

{"foo" => {"bar" => "baz"}}.key_flatten
# => {"foo.bar" => "baz"}

{"foo.bar" => "baz"}.key_unflatten
# => {"foo" => {"bar" => "baz"}}
```

### Specify delimiter

```rb
{"foo" => {"bar" => "baz"}}.key_flatten(delimiter: "_")
# => {"foo_bar" => "baz"}

{"foo_bar" => "baz"}.key_unflatten(delimiter: "_")
# => {"foo" => {"bar" => "baz"}}
```

### Symbolize keys

```rb
{"foo" => {"bar" => "baz"}}.key_flatten(symbolize_keys: true)
# => {:"foo.bar" => "baz"}

{"foo.bar" => "baz"}.key_unflatten(symbolize_keys: true)
# => {foo: {bar: "baz"}}
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/yuya-takeyama/key_flatten.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

