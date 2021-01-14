class UsersController < ApplicationController
 
  before_action :set_user, only: [:show]
  before_action :check_login
  skip_before_action :check_login, :only => [:create, :new]


  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    
     @user = User.new(user_params)
     
     if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user) 
     else
      flash[:alert] = []
      @user.errors.full_messages.each do |msg|
       
   #     msg = msg.split(" ")
   #     msg.shift()
   #     msg = msg.join(" ")
        flash[:alert] << "   " + msg + "   "
      end
      redirect_to new_user_path
     end
  end



  def show
    @user = User.find(params[:id])
    
     
      render :show
  
  end



  def destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :npc)
  end
end