class UsersController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show, :banned?]
  before_action :set_user, only: [:show, :edit]
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

end
