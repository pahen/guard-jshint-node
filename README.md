## This project is no longer maintained by me since I'm not using Guard in my projects anymore. Feel free to contact me if you wan't to be a new maintainer.

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

* `:notify_on_success   # default => true`

If Growl messages should be displayed on success or not.

* `:notify_on_failure   # default => true`

If Growl messages should be displayed on failure or not.

### Example

	guard 'jshint-node', :config => 'path/to/config.json' do
  		watch(%r{^scripts\/.*\.js$})
	end

# Build & Test Install

	bundle -V check
	gem build -V guard-jshint-node.gemspec
	gem check --verify guard-jshint-node-<VERSION>.gem

	gem install --local -V guard-jshint-node-<VERSION>.gem
	gem uninstall -a guard-jshint-node


# Running Tests

	bundle exec rake