require "rspec"

Rspec.configure do |config|
	config.order = "random"
		config.include Capybara::DSL
end
