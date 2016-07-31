class UsersController < ApplicationController
  before_action :set_user, only:          [:show, :edit, :update, :destroy]

  before_action :require_login,  except:  [:new, :create]
  before_action :correct_user,   only:    [:edit, :update]
  before_action :require_logout, only:    [:new]
  before_action :admin_user,     only:    [:destroy]
  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(permitted_user_params)

    respond_to do |format|
      if @user.save
        log_in(@user)
        flash[:success] = 'Your account has been successfully created.'
        flash[:info] = 'Please fill in your account information'
        format.html { redirect_to account_path }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(permitted_user_params)
        flash[:success] = 'Account information updated.'
        format.html { redirect_to @user }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render '/sessions/edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      flash[:success] = 'Account deleted.'
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def permitted_user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name, :contact_number)
    end

    #--- Authorisations ---#
    def require_login
      #check if the user is logged in or not
      unless logged_in?
        flash[:danger] = "WHAT CHU DOING? Please log in."
        redirect_to root_url # halts request cycle
      end
    end

    def correct_user
      @user = User.find(params[:id])

      unless current_user?(@user)
        flash[:warning] = "YOU ARE NOT JOSE"
        redirect_to root_url
      end
    end

    def require_logout
      if logged_in?
        flash[:warning] = "Log out first before creating a new account."
        redirect_to(root_url)
      end
    end

    def admin_user
      unless current_user.admin?
        flash[:warning] = "YOU ARE NOT AUTHORISED! CALL 999 FOR ASSISTANCE"
        redirect_to users_url
      end
    end
end
