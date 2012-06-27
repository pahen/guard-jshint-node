# Guard::JshintNode

[![Build Status](https://secure.travis-ci.org/pahen/guard-jshint-node.png)](http://travis-ci.org/pahen/guard-jshint-node)

This guard will run [JSHint](http://www.jshint.com/) for you automatically when files are modified.

## Install

Make sure you have [guard](http://github.com/guard/guard) and [jshint](http://github.com/jshint/node-jshint) installed.

Install the gem with:

    gem install guard-jshint-node

Or add it to your Gemfile:

    gem 'guard-jshint-node'

And then add a basic setup to your Guardfile:

    guard init jshint-node

## Usage

For configuration example, see [example/config.json](https://github.com/jshint/node-jshint/blob/master/example/defaults.json) and the available [options](http://www.jshint.com/options).



## Options

* `:executable   # default => "jshint"`

Specify alternative path to the jshint command.

* `:config   # default => "jshint-config.json"`

Specify path to config file.

* `:notify   # default => true`

If Growl messages should be displayed or not.

### Example

	guard 'jshint-node', :config => 'path/to/config.json' do
  		watch(%r{^scripts\/.*\.js$})
	end

# Running Tests

	bundle exec rake