class UsersController < ApplicationController
    def new
        if current_user
            redirect_to "/users/#{current_user.id}"
        end
    end
    def create
        user = User.create(user_params)
        if user.valid?
          session[:user_id] = user.id
          redirect_to "/users/#{user.id}"
      else
          flash[:user_errors] = user.errors.full_messages
          redirect_to '/'
      end
    end
    def show
        if !current_user
            redirect_to '/'
        end
        @current_user = current_user
        @borrower = User.where(role: 'Borrower')

    end
    def lend
        user = current_user
        lender = Lending.create(money: params[:money], lender_id: user.id, borrower_id: params[:id])
    end
    private
        def user_params
            params.require(:user).permit(:name, :email, :password, :password_confirmation, :money, :amount_needed, :reason, :description, :role)
        end
end
