class ApplicationController < ActionController::Base
   # self.abstract_class = true
   helper_method :current_user
   helper_method :logged_in?

   def current_user
     @current_user ||= User.find(session[:user_id]) if session[:user_id]
     
   end

   def logged_in?
    if session[:user_id]
    return true
    else
    return false
    end
   end
end
