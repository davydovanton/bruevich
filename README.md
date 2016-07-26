# Bruevich

Simple library for benching your code.

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
  title: String
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


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/bruevich. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

