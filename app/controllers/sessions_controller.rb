#class SessionsController < ApplicationController
#    # This is required because of a quirk the "developer" authentication
#    # strategy. We'll remove this when we move to a "real" provider.
#    skip_before_action :verify_authenticity_token, only: :create
#  
#    def create  
#       if auth
#
#         @user = User.find_or_create_by(uid: auth['uid']) do |u|
#          u.name = auth['info']['name']
#          u.email = auth['info']['email']
#        end
#
#        if @user.valid?
#         binding.pry
#         session[:user_id] = @user.id
#         redirect_to user_path(@user)
#        end
#       #else
#       # @user = User.find_by(email: params[:email])
#       # if @user && @user.authenticate(params[:password])
#       #   session[:user_id] = @user.id
#       #   redirect_to user_path(@user)
#       # end
#      
#      end
#
#         render 'welcome/home'
#  
#    end
#
#
#    def destroy
#      session.delete :user_id
#      redirect_to root_url, :notice =>"Logged out"
#    end
#
#
#    def failure
#      redirect_to login_path, alert: "Authentication failed, please
#     try again."
#    end
# 
#    
#
#    private
#         
#    def auth
#      request.env['omniauth.auth']
#    end
#
#  end
#  













class SessionsController < ApplicationController
  # This is required because of a quirk the "developer" authentication
  # strategy. We'll remove this when we move to a "real" provider.
  skip_before_action :verify_authenticity_token, only: :create

  

  def create  
    
    if auth

            @user = User.find_or_create_by(uid: auth['uid']) do |u|
             u.name = auth['info']['name']
             u.email = auth['info']['email']
             u.password = auth["uid"]
           end
         
         if @user.valid?
           session[:user_id] = @user.id
           redirect_to user_path(@user)
         end

  else
          @user = User.find_by(email: params[:auth_key])
          if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
          else
          
            flash[:alert] = "Invalid username/password combination"
          redirect_to '/login'
          end
  end
end


  def destroy
    session.delete :user_id
    redirect_to root_url, :notice =>"Logged out"
  end


  def failure
    redirect_to login_path, alert: "Authentication failed, please
   try again."
  end

  

  private
       
  def auth
    request.env['omniauth.auth']
  end

end