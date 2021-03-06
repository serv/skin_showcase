module AuthenticateHelper
  # Logs in the given authentication.
  def log_in(user)
    session[:user_id] = user.id
  end

  # Remembers a user in a persistent session.
  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  # Returns the current logged-in user (if any).
  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
    end
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end

  # Forgets a persistent session.
  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  # Logs out the current user.
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end

  def filter_require_login
    unless logged_in?
      flash[:error] = 'Please sign in first.'
      redirect_to signin_path
    end
  end

  # TODO: error handling better
  def verify_recaptcha?(g_recaptcha_response, remote_ip)
    uri = URI('https://www.google.com/recaptcha/api/siteverify')
    data = {
      secret: '6LeRBAcUAAAAAA1mK5gFcIHjQlGkgpAccXT8sQqu',
      response: g_recaptcha_response,
      remoteip: remote_ip
    }
    res = Net::HTTP.post_form(uri, data)
    success = JSON.parse(res.body)['success']
    success == true
  end
end
