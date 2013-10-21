require "rspec"
require "rack"

Rspec.configure do |config|
	config.order = "random"
		config.include Capybara::DSL
end
