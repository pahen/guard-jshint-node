require 'rspec'
require 'guard/jshint-node'

describe Guard::JshintNode do

	subject { Guard::JshintNode.new }

	describe "#run_on_change" do

		it "with good file" do
			subject.run_on_change(['spec/fixtures/good.js']).should == true
		end

		it "with bad file" do
			subject.run_on_change(['spec/fixtures/bad.js']).should == false
		end

	end

end