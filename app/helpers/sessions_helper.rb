module SessionsHelper

  # 전달받은 유저로 로그인한다.
  def log_in(user)
    session[:user_id] = user.id
  end

  # 현재 로그인 중인 유저를 리턴한다.
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  # 유저가 로그인 해 있으면 true, 아니라면 false를 리턴한다.
  def logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
