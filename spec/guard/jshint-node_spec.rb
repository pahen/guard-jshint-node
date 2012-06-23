require 'rspec'
require 'guard/jshint-node'

describe Guard::JshintNode do

	subject { Guard::JshintNode.new }

	describe "#run_on_changes" do

		it "with good file" do
			subject.run_on_changes(['spec/fixtures/good.js']).should == true
		end

		it "with bad file" do
			subject.run_on_changes(['spec/fixtures/bad.js']).should == false
		end

	end

end