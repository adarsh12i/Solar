class LoginController < ApplicationController
layout false


before_action :logged_in_user, :except => [:login, :login_view] 


  def login_view
 render 'login_view.html.erb'
  end

def login
  begin
client = Mysql2::Client.new(:host => "localhost", :username => "root", :password => "sql123", :database => "apexindia_solar1")
rescue Mysql2::Error => e
puts "error"
ensure
#disconnect from server
end

@username =params[:username] 
@password   =  params[:password]

if(  @username.length == 0 || @password.length == 0 ) 		
#@errors = 'User name or password can not be empty';
 flash[:notice] = "User name or password can not be empty"
redirect_to '/login'
else 	
#$errors = 'Invalid user name or password';
@result = client.query("SELECT * FROM user_details_tbl WHERE `user_name` LIKE BINARY '#{@username}' AND `user_password` =MD5('#{@password}') AND portal_access= 'Yes' ")
if @result.count==0 
 flash[:notice] = "Invalid user name or password"
redirect_to '/login'
else

@user_id=[];
@user_category_id=[];

@result.each do |tim|
@user_id.push(tim['user_details_tbl_id'])
@user_category_id.push(tim['user_category_tbl_id'])
end
 session[:status] = 1
 session[:user_name] = @username
 session[:user_id] = @user_id
 session[:user_category_tbl_id] = @user_category_id[0]

end
end	

if session[:status] == 1 
if session[:user_category_tbl_id] == 1
redirect_to '/report_admin'

end
if session[:user_category_tbl_id] == 5
redirect_to '/report'
end
if session[:user_category_tbl_id] == 7
redirect_to '/report'
end

		
end

 end


def logged_in_user

unless session[:user_id]
	redirect_to '/login'

return false
else

return true
 end

end


end
