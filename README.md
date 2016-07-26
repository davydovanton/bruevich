# Bruevich

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/bruevich`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'bruevich'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bruevich

## Usage

```ruby
require 'pp'

bruevich = Bruevich.new
bruevich.bench do
  (1..1_000_000).to_a
end

pp bruevich.result
```

Also you can change iterations ( by default - `[1, 10, 50, 100, 150]`).

```ruby
bruevich = Bruevich.new(iterations: [1, 2, 3, 4, 5])

# or

bruevich = Bruevich.new
bruevich.iterations = [1, 2, 3, 4, 5]
```

### Returned values
```
{
  iteration_count(Integer) => {
    time: {
      per_iteration: Array,
      total: Float,
      average: Float
    },
  mem: {
      per_iteration: Array,
      total: Integer,
      average:Integer
    }
  },

  ...
}
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/bruevich. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

