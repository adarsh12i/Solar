class LogoutController < ApplicationController
  def logout_view
 session[:status] = nil
 session[:user_name] = nil	
 session[:user_id] = nil
redirect_to '/login'
  end
end
