require "rspec"
require "rack"
require "capybara/rspec"
require "capybara/dsl"
require File.expand_path("../app/application", File.dirname(__FILE__))

Capybara.app = Application
Capybara.default_driver = :selenium

RSpec.configure do |config|
	config.order = "random"
	config.include Capybara::DSL
end
