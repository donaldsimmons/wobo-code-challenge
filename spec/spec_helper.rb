require "rspec"
require "rack"
require "capybara/rspec"
require "capybara/dsl"
require File.expand_path("../app/controllers/application_controller", File.dirname(__FILE__))

Capybara.app = ApplicationController
Capybara.default_driver = :selenium

RSpec.configure do |config|
	config.order = "random"
	config.include Capybara::DSL
end
