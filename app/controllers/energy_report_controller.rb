class EnergyReportController < ApplicationController
before_action :logged_in_user

def energy_report_view

client = Mysql2::Client.new(:host => "localhost", :username => "root", :password => "sql123", :database => "apexindia_solar1")

@energy_data=client.query("select DATE_FORMAT(updated_time, '%H:%i:%s') as updated_time,DATE_FORMAT(updated_date, '%Y/%m/%d') as updated_date,concat(updated_date,updated_time) as updated_date_time,kw_total ,kw_rphase ,kw_yphase,kw_bphase ,power_factor_average ,power_factor_rphase ,power_factor_yphase ,power_factor_bphase,vyb_phase, vbr_phase, vln_average, vr_phase, vy_phase, vb_phase, cur_average, cur_rphase, cur_yphase, cur_bphase, total_frequency, rphase_frequency, yphase_frequency, bphase_frequency, dg_kilowatt_hour, mains_kilowatt_hour, rphase_reactive_power, yphase_reactive_power, bphase_reactive_power  ,rphase_apparent_power  ,yphase_apparent_power  ,bphase_apparent_power ,volt_average  ,vry_phase  FROM inverter_ex_data_tbl order by updated_date_time desc limit 10 ")  

client.close();
end


def energy_search

client = Mysql2::Client.new(:host => "localhost", :username => "root", :password => "sql123", :database => "apexindia_solar1")

@fromdate=params[:fromdate]
@todate=params[:todate]
@inverter_ctrlrid=params[:controllerid]
#puts @fromdate



if (@fromdate =="" and @todate =="")

@selquery=client.query("select * from inverter_ex_data_tbl order by updated_date desc, updated_time desc Limit 1")
	if @selquery.count > 0
		@lastupdated_date=[];
		@selquery.each do |tim|
		@lastupdated_date.push(tim['updated_date'])
		end
#puts @lastupdated_date
		@energy_data=client.query("select DATE_FORMAT(updated_time, '%H:%i:%s') as updated_time,DATE_FORMAT(updated_date, '%Y/%m/%d') as updated_date,concat(updated_date,updated_time) as updated_date_time,kw_total ,kw_rphase ,kw_yphase,kw_bphase ,power_factor_average ,power_factor_rphase ,power_factor_yphase ,power_factor_bphase,vyb_phase, vbr_phase, vln_average, vr_phase, vy_phase, vb_phase, cur_average, cur_rphase, cur_yphase, cur_bphase, total_frequency, rphase_frequency, yphase_frequency, bphase_frequency, dg_kilowatt_hour, mains_kilowatt_hour, rphase_reactive_power, yphase_reactive_power, bphase_reactive_power  ,rphase_apparent_power  ,yphase_apparent_power  ,bphase_apparent_power ,volt_average  ,vry_phase FROM inverter_ex_data_tbl where updated_date = '#{@lastupdated_date[0]}' AND ctrlr_serial_no = '#{@inverter_ctrlrid}'  order by updated_date_time desc limit 10")

	else
		#puts "Record Not Found"			
	end
else
@energy_data =client.query("select DATE_FORMAT(updated_time, '%H:%i:%s') as updated_time,DATE_FORMAT(updated_date, '%Y/%m/%d') as updated_date,concat(updated_date,updated_time) as updated_date_time,kw_total ,kw_rphase ,kw_yphase,kw_bphase ,power_factor_average ,power_factor_rphase ,power_factor_yphase ,power_factor_bphase,vyb_phase, vbr_phase, vln_average, vr_phase, vy_phase, vb_phase, cur_average, cur_rphase, cur_yphase, cur_bphase, total_frequency, rphase_frequency, yphase_frequency, bphase_frequency, dg_kilowatt_hour, mains_kilowatt_hour, rphase_reactive_power, yphase_reactive_power, bphase_reactive_power  ,rphase_apparent_power  ,yphase_apparent_power  ,bphase_apparent_power ,volt_average  ,vry_phase  FROM inverter_ex_data_tbl where updated_date between  '#{@fromdate}' AND '#{@todate}' AND ctrlr_serial_no = '#{@inverter_ctrlrid}' order by updated_date_time desc")
end


client.close();
render 'energy_report_view'
end




end
