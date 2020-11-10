class ApplicationController < ActionController::Base
   # self.abstract_class = true
   helper_method :current_user

   def current_user
     @current_user ||= User.find(session[:user_id]) if session[:user_id]
     
   end

end
