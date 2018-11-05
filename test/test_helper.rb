ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  def setup
    @current_user = User.new(first_name: 'Paul', last_name: 'TD', email: 'aaa', password: 'aaa').save 
  end

end
