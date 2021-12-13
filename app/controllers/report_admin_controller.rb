class ReportAdminController < ApplicationController
 layout 'adminlayout'

before_action :logged_in_user
  def report_admin_view
client = Mysql2::Client.new(:host => "localhost", :username => "root", :password => "sql123", :database => "apexindia_solar1")

@controllerid = [];
@ctrlr_details=client.query("select ctrlr_serial_no from ctrlr_detail_tbl")
@ctrlr_details.each do |val|
@controllerid.push(val['ctrlr_serial_no'])
end

@report_details=client.query("select DATE_FORMAT(updated_time, '%H:%i:%s') as updated_time,DATE_FORMAT(updated_date, '%Y/%m/%d') as updated_date,concat(updated_date,updated_time) as updated_date_time,inv0_kw_solar as solar_kw ,kw_total ,kw_rphase,kw_yphase,kw_bphase,desired_power_output,achieved_inverter_power,rated_power_percentage  FROM inverter_ex_data_tbl order by updated_date_time desc limit 10 ")  

client.close();
  end

def report_admin_search

client = Mysql2::Client.new(:host => "localhost", :username => "root", :password => "sql123", :database => "apexindia_solar1")

@fromdate=params[:fromdate]
@todate=params[:todate]
@inverter_name=params[:selinverter]
@inverter_ctrlrid=params[:controllerid]
#puts @fromdate

@controllerid = [];
@ctrlr_details=client.query("select ctrlr_serial_no from ctrlr_detail_tbl")
@ctrlr_details.each do |val|
@controllerid.push(val['ctrlr_serial_no'])
end


if @iverter_name==1
if (@fromdate =="" and @todate =="")

@selquery=client.query("select * from inverter_ex_data_tbl order by updated_date desc, updated_time desc Limit 1")
	if @selquery.count > 0
		@lastupdated_date=[];
		@selquery.each do |tim|
		@lastupdated_date.push(tim['updated_date'])
		end
#puts @lastupdated_date
		@report_details=client.query("select DATE_FORMAT(updated_time, '%H:%i:%s') as updated_time,DATE_FORMAT(updated_date, '%Y/%m/%d') as updated_date,concat(updated_date,updated_time) as updated_date_time,inv1_kw_solar as solar_kw ,kw_total ,kw_rphase,kw_yphase,kw_bphase,desired_power_output,achieved_inverter_power,rated_power_percentage  FROM inverter_ex_data_tbl where updated_date = '#{@lastupdated_date[0]}' AND ctrlr_serial_no = '#{@inverter_ctrlrid}'  order by updated_date_time desc limit 10")

	else
		#puts "Record Not Found"			
	end
else
@report_details =client.query("select DATE_FORMAT(updated_time, '%H:%i:%s') as updated_time,DATE_FORMAT(updated_date, '%Y/%m/%d') as updated_date,concat(updated_date,updated_time) as updated_date_time,inv1_kw_solar as solar_kw ,kw_total ,kw_rphase,kw_yphase,kw_bphase,desired_power_output,achieved_inverter_power,rated_power_percentage  FROM inverter_ex_data_tbl where updated_date between  '#{@fromdate}' AND '#{@todate}' AND ctrlr_serial_no = '#{@inverter_ctrlrid}'  order by updated_date_time desc")
end
else
if (@fromdate =="" and @todate =="")

@selquery=client.query("select * from inverter_ex_data_tbl order by updated_date desc, updated_time desc Limit 1")
	if @selquery.count > 0
		@lastupdated_date=[];
		@selquery.each do |tim|
		@lastupdated_date.push(tim['updated_date'])
		end
#puts @lastupdated_date
		@report_details=client.query("select DATE_FORMAT(updated_time, '%H:%i:%s') as updated_time,DATE_FORMAT(updated_date, '%Y/%m/%d') as updated_date,concat(updated_date,updated_time) as updated_date_time,inv0_kw_solar as solar_kw ,kw_total ,kw_rphase,kw_yphase,kw_bphase,desired_power_output,achieved_inverter_power,rated_power_percentage  FROM inverter_ex_data_tbl where updated_date = '#{@lastupdated_date[0]}' AND ctrlr_serial_no = '#{@inverter_ctrlrid}'   order by updated_date_time desc limit 10")

	else
		#puts "Record Not Found"			
	end
else
@report_details =client.query("select DATE_FORMAT(updated_time, '%H:%i:%s') as updated_time,DATE_FORMAT(updated_date, '%Y/%m/%d') as updated_date,concat(updated_date,updated_time) as updated_date_time,inv0_kw_solar as solar_kw ,kw_total ,kw_rphase,kw_yphase,kw_bphase,desired_power_output,achieved_inverter_power,rated_power_percentage FROM inverter_ex_data_tbl where updated_date between  '#{@fromdate}' AND '#{@todate}' AND ctrlr_serial_no = '#{@inverter_ctrlrid}'  order by updated_date_time desc")
end

end

client.close();
render 'report_admin_view'
end

end
