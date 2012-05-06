require 'guard'
require 'guard/guard'

module Guard
	class JshintNode < Guard

		DEFAULT_OPTIONS = {
			:config => 'jshint-config.json',
			:notify => true,
		}

		# Initialize a Guard.
		# @param [Array<Guard::Watcher>] watchers the Guard file watchers
		# @param [Hash] options the custom Guard options
		def initialize(watchers = [], options = {})
			defaults = DEFAULT_OPTIONS.clone
			@options = defaults.merge(options)
			super(watchers, @options)
		end

		# Called on file(s) modifications that the Guard watches.
		# @param [Array<String>] paths the changes files or paths
		# @raise [:task_has_failed] when run_on_change has failed
		def run_on_change(paths)
			paths.each do |path|

				is_old_version = (Gem::Version.new(`jshint --version`) < Gem::Version.new('0.5.2'))
				results = `jshint #{path} --config #{@options[:config]}`

				if (is_old_version and results.include? 'Lint Free!') or (!is_old_version and $?.to_i == 0) then
					if options[:notify]
						::Guard::Notifier.notify('No errors found.', :title => 'JSHint', :image => :success)
					end
					return true
				else
					if options[:notify]
						::Guard::Notifier.notify(results, :title => 'JSHint Errors', :image => :failed)
					end
					print results
					return false
				end

			end
		end

	end
end