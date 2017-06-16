class SessionsController < ApplicationController
    def create
    #   logging in
    user = User.find_by(email: login_params[:email])
    if user && user.authenticate(login_params[:password])
        session[:user_id] = user.id
        redirect_to "/users/#{user.id}"
    else
        flash[:login_errors] = 'Invalid shit bruh.'
        redirect_to '/'
    end
  end

  def destroy
      reset_session
      redirect_to '/'
  end
  private
    def login_params
        params.require(:user).permit(:email, :password)
    end
end
