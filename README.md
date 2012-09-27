# Loopy

Ruby gem for running regularly repeated tasks. Ideally for tasks that need to be run so frequently that Cron
is an unsuitable choice. For example, jobs that need to run every 30 seconds.

## Installation

Add this line to your application's Gemfile:

    gem 'loopy'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install loopy

## Usage

    Loopy.run(method_name, delay_in_seconds, &block)

Example:

    Loopy.run("Check twitter", 30) do
      Twitter.check('@supercool')
    end

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
