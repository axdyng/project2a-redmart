class SessionsController < ApplicationController

  def new
  end

  def edit
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password])
      # redirect to user page
      flash[:success] = "Yayzer logged in. Let\'s go shopping!"
      log_in(user)
      redirect_to user    # user automatically convered to route user_url(user)

    else
      #show error message
      flash.now[:danger] = 'Invalid email or password'
      render 'new'
    end
  end

  def update
    if current_user.update_attributes(permitted_user_params)
      flash[:success] = "Account information updated."
      redirect_to current_user
    else
      render 'edit'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

  private

  def permitted_user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name, :contact_number)
  end

end
