class UsersController < ApplicationController
  #the normal user stuff
#how would I know what to create / where to start
  #q on user params
#q on sql lite
#in create # No bang right?

  #do not forget to create routes
  #must be logged out to log in
  before_action :require_logged_out, only: [:new, :create]

  def new
    @user = User.new
    render :new
  end

  def create
    #we don't want this as create because create does the actions of
    #both new and save. So we only want new.
    @user = User.new(user_params)
    if @user.save
      redirect_to users_url #and then I'd need to create an index page
    else
      flash.now[:errors] = @user.errors.full_messages
      redirect_to new_user_url
      # or I could do: render :new
    end
  end

  private

  def user_params
    #where is password even coming from
    params.require(:user).permit(:email, :password)
    # name=user[:password] value="123"
    # user[password: '123']
    # params.require(:user) > [password: '123']
    # .permit(:email, :password) > password: '123'
  end
end