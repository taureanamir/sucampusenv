class UsersController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show, :banned?]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  #before_action :only_see_own_page


  def index
    if current_user.role_id == 1
      @users = User.all
      @is_admin = 1
      @users_recent_register = User.order('created_at desc').limit(5)
      @users_recent_login = User.order('last_sign_in_at desc').limit(5)
    else
      flash[:notice] = 'You do not have authority to access this page !!!'
      render sucampusenv_home_path
    end
  end

  def show
    if current_user != @user
      redirect_to sucampusenv_home_path, notice: "Oh Ohh!!! You can only see your own profile page."
    end
  end

  def new
    @user = User.new
  end

  def edit
    if params[:ban] == '1'
      User.find(params[:id]).update_attribute('role_id', 3)
      @notice = 'Successfully banned'
    elsif params[:ban] == '0'
      User.find(params[:id]).update_attribute('role_id', 2)
      @notice = 'Successfully unbanned'
    end
    redirect_to users_path, notice: @notice
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        UserMailer.signup(@user).deliver
        format.html {redirect_to @user, notice: 'User was successfully created.'}
        format.json {render :show, status: :created, location: @user}
      else
        format.html {render :new}
        format.json {render json: @user.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html {redirect_to @user, notice: 'User was successfully updated.'}
        format.json {render :show, status: :ok, location: @user}
      else
        format.html {render :edit}
        format.json {render json: @user.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html {redirect_to users_url, notice: 'User was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  def banned?
    if current_user.present? && current_user.role_id == 3
      sign_out current_user
      flash[:error] = "Your account has been suspended !!!"
      sucampusenv_home_path
    end
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    #begin
    @user = User.find(params[:id])
    if current_user.role_id == 1
      @is_admin = 1
    end
    #rescue ActiveRecord::RecordNotFound => e
    # redirect_to sucampusenv_home_path, notice: "Oh Ohh!!! You can only see your own profile page."
    #end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params[:user]
  end
end
