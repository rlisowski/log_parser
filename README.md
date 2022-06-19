# Parser

Receives a log path as an argument and prints total page views and uniqueness counters.

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add log_parser

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install log_parser

## Usage

### While working with source code

#### From CLI 

`bundle exec exe/log_parser samples/webserver.log`

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/rlisowski/log_parser. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/parser/blob/master/CODE_OF_CONDUCT.md).

## Code of Conduct

Everyone interacting in the Parser project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/parser/blob/master/CODE_OF_CONDUCT.md).
