class SessionsController < ApplicationController
  #only need methods for login and logout
  #since a session is always single, resources in routes is made single



end


# class SessionsController < ApplicationController
  
#   # when logged out, can only login or create new account
#   before_action :require_logged_out, only: [:new, :create]
#   # when logged in, can only logout
#   before_action :require_logged_in, only: [:destroy]

#   def new
#     @user = User.new
#     # render :new
#   end

#   #logging in
#   def create
#     #verifies username and password
#     @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
#     if @user
#       # if user is found, log them in and redirect to cats index page
#       login(@user)
#       redirect_to cats_url
#     else
#       # if no user is found with the params submitted, render the new account form
#       render :new
#     end
#   end

#   def destroy
#     # logout = destroy current session
#     logout!
#     # redirect to login page after logging out
#     redirect_to new_session_url
#   end



# end