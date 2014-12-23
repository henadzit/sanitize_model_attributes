# SanitizeModelAttributes

Sanitize ActiveRecord attributes.
This gem depends on [sanitize](https://github.com/rgrove/sanitize) gem.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sanitize_model_attributes'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sanitize_model_attributes

## Usage

### Before

```
class Tree < ActiveRecord::Base
end

tree = Tree.new
tree.name = '<string>hogehoge</strong>'
p tree.name #=> "<string>hogehoge</strong>"
```

### After

```
class Tree < ActiveRecord::Base
  include SanitizeModelAttributes

  sanitize_attributes :name
end

tree = Tree.new
tree.name = '<string>hogehoge</strong>'
p tree.name #=> "strong"
```

## Contributing

1. Fork it ( https://github.com/tachiba/sanitize_model_attributes/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
