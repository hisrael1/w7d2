class ApplicationController < ActionController::Base
  #protect from forgery?
  skip_before_action :verify_authenticity_token

  #this allows us to use these methods in other classes
  helper_method :current_user, :logged_in?

  def current_user
    #since app cont is inherited, we need to use an instance
    # variable in order to refer to it

    #looks up user with the current session token
    #how to tell whether or not I should be using an @
    #User.find_by is active record
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def ensure_logged_in
    redirect_to new_users_url unless logged_in?
  end

  def logged_in?
    #returns current user or nil and then true if current user == current user
    #or false if current user != current user
    #!! != ! !
    !!current_user 
  end

  def log_in!(user)
    #remember that the user has a unique session token created in user model
    #in user.session_token 
    #re randomizing the session token for the user
    #this is because at any point someone could possibly crack the old session token
    session[:session_token] = user.reset_session_token
    #the right part returns a session token
  end

  def log_out!
  #we know a user is logged in
  # when a users session token = the sessions session token
  #so we must make the opposite true
  # so the users sess token and the sessions session token must be changed
  #we know the session is universally available
  # the session token of the current user can be accesed through current_user
  session[:session_token] = nil
  current_user.reset_session_token!
  #this is to un assign @current user
  @current_user = nil
  end

end
