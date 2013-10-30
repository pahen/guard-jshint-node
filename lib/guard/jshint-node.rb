require 'guard'
require 'guard/guard'

module Guard
	class JshintNode < Guard

		DEFAULT_OPTIONS = {
			:config => 'jshint-config.json',
			:executable => 'jshint',
			:notify_on_success => true,
			:notify_on_failure => true,
			:run_at_start => true
		}

		# Initialize a Guard.
		# @param [Array<Guard::Watcher>] watchers the Guard file watchers
		# @param [Hash] options the custom Guard options
		def initialize(watchers = [], options = {})
			defaults = DEFAULT_OPTIONS.clone
			@options = defaults.merge(options)
			super(watchers, @options)
		end

		def start
			run_all if options[:run_at_start]
		end

		def reload
			run_all
		end

		def run_all
			run_on_changes(Watcher.match_files(self, Dir.glob(File.join('**', '*.*'))))
		end

		# Called on file(s) modifications that the Guard watches.
		# @param [Array<String>] paths the changes files or paths
		# @raise [:task_has_failed] when run_on_changes has failed
		def run_on_changes(paths)
			paths.each do |path|

				is_old_version = (Gem::Version.new(`#{@options[:executable]} --version`) < Gem::Version.new('0.5.2'))
				results = `#{@options[:executable]} #{path} --config #{@options[:config]}`

				if (is_old_version and results.include? 'Lint Free!') or (!is_old_version and $?.to_i == 0) then
					if options[:notify_on_success]
						::Guard::Notifier.notify('No errors found.', :title => 'JSHint', :image => :success)
					end
					return true
				else
					if options[:notify_on_failure]
						::Guard::Notifier.notify(results, :title => 'JSHint Errors', :image => :failed)
					end
					print results
					return false
				end

			end
		end

	end
end
