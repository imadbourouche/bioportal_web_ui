ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: 1)

  # Add more helper methods to be used by all tests here...


  Capybara.server_host = "0.0.0.0"
  Capybara.app_host = "http://#{Socket.gethostname}:#{Capybara.server_port}"

end