# Guard::JshintNode

This guard will run [JSHint](http://www.jshint.com/) for you automatically when files are modified.

## Install

Make sure you have [guard](http://github.com/guard/guard) and [jshint](http://github.com/jshint/node-jshint) installed.

Install the gem with:

    gem install guard-node-jshint

Or add it to your Gemfile:

    gem 'guard-node-jshint'

And then add a basic setup to your Guardfile:

    guard init node-jshint

## Usage

For configuration example, see [example/config.json](http://github.com/jshint/node-jshint/blob/master/example/config.json) and the available [options](http://www.jshint.com/options).

## Options

* `:config   # default => "jshint-config.json"`

Specify path to config file.

* `:notify   # default => true`

If Growl messages should be displayed or not.

### Example

	guard 'jshint', :config => 'path/to/config.json' do
  		watch(%r{^scripts\/.*\.js$})
	end