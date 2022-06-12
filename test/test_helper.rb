ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/reporters' #추가
Minitest::Reporters.use!	

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  include ApplicationHelper

  # 테스트 유저가 로그인 중인 경우 true를 리턴한다.
  def is_logged_in?
    !session[:user_id].nil?
  end

  # 테스트 유저로 로그인한다.
  def log_in_as(user)
    session[:user_id] = user.id
  end
end

  class ActionDispatch::IntegrationTest

    # 테스트 유저로 로그인한다.
    def log_in_as(user, password: 'password', remember_me: '1')
      post login_path, params: { session: { email: user.email,
                                            password: password,
                                            remember_me: remember_me } }
    end
end
