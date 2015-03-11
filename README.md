[![Gem Version](https://badge.fury.io/rb/integer_to_english.svg)](http://badge.fury.io/rb/integer_to_english)

# IntegerToEnglish

The ```Integer``` class is pimped up with the ```to_english``` method.

Regarding the names of numbers above million, the "short scale" will be used as it is used increasingly in British English too.
English grammar source used: http://en.wikipedia.org/wiki/English-language_numerals

**Limitation**: The highest number it can convert is less then 1 quintillion (10^18)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'integer_to_english'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install integer_to_english

## Usage

```ruby
7.to_english
'seven'
```

```ruby
42to_english
'forty-two'
```

```ruby
2001.to_english
'two thousand and one'
```

```ruby
1999.to_english
'nineteen hundred and ninety-nine'
```

US vs UK (UK is default, if you think otherwise, "fork it!")

```ruby
999_000.to_english
'nine hundred and ninety-nine thousand'
```

```ruby
999_000.to_english :us
'nine hundred ninety-nine thousand'
```

## Contributing

1. Fork it ( https://github.com/vadviktor/integer_to_english/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
