module SessionsHelper

  # 입력받은 유저로 로그인한다.
  def log_in(user)
    session[:user_id] = user.id
  end

  # 유저의 세션을 영속화합니다.
  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  # 입력받은 유저가 로그인해있다면 true를 리턴한다.
  def current_user?(user)
    user == current_user
  end

  # remember token cookie에 대응하는 유저를 리턴한다.
  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end

  # 유저가 로그인 해 있으면 true, 아니라면 false를 리턴한다.
  def logged_in?
    !current_user.nil?
  end

  # 영속적인 세션을 파기합니다.
  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  # 현재 유저를 로그아웃합니다.
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
