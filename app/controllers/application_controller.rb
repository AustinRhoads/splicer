class ApplicationController < ActionController::Base
  
  
   helper_method :current_user
   helper_method :logged_in?
   helper_method :check_login
   helper_method :user_is_self
   helper_method :winner


   def current_user
     @current_user ||= User.find(session[:user_id]) if session[:user_id]
     
   end

   def winner
     @winner = User.most_battles_won
   end

   def user_is_self
     current_user == @user ? true:false
   end

   def logged_in?
        if session[:user_id]
             return true
        else
             return false
        end
   end

   def check_login
    unless logged_in?
    redirect_to login_path
    end
   end

end
