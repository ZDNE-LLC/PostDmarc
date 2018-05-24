# PostDmarc

This is a simple gem that I use to fetch DMARC reports from the Postmark DMARC API.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'PostDmarc', github: 'ZachNusbaum/PostDmarc'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install PostDmarc

## Usage

```ruby
# Initialize the client with your Postmark DMARC API Token
client = PostDmarc::Client.new(API_KEY)

# Gets list of DMARC reports for domain
reports = client.reports

# Gets a single DMARC report by ID
report = client.report(REPORT_ID)

# Shows the required DNS record
dns_snippet = client.dns_snippet
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/PostDmarc.
