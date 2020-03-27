# Land
Land is a clickstream tracker for Rails applications. It will track visits, pageviews, marketing attribution and more.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'land'
```

And then execute:

    $ bundle install

Or, install it yourself:

    $ gem install land

To copy migrations to db/migrate run:

    $ rails land:install:migrations

## Configuration

Install with:

    $ rails g land:install

Then edit `config/initializers/land.rb`.

## Development

After checking out the repo, run `bin/setup` to install dependencies, create database, and confirm test suite is working. You can also run `rails console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

To start a console run `bin/rails console` or `rails c`

## Testing

Land uses a gem called __appraisal__ to test against multiple versions of Rails. Another gem, __combustion__ provides a minimal environment to run Rails.

Setup your database using `rails db:drop db:create db:migrate`.

To run the test suite against all versions of rails run `rake` or `appraisal rspec`.
To run the test suite against just the latest version of rails run `rspec`.

[Appraisal](https://github.com/thoughtbot/appraisal) | [Combustion](https://github.com/pat/combustion)

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/companygardener/land.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
