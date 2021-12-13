

class InverterReportController < ApplicationController

before_action :logged_in_user

  def inverter_report_view

client = Mysql2::Client.new(:host => "localhost", :username => "root", :password => "sql123", :database => "apexindia_solar1")


@inverter_data=client.query("select DATE_FORMAT(updated_time, '%H:%i:%s') as updated_time,DATE_FORMAT(updated_date, '%Y/%m/%d') as updated_date,concat(updated_date,updated_time) as updated_date_time,inv0_energy as energy ,inv0_kw_solar as solar_kw ,inv0_hrs_count as hrs_count ,inv0_pv1_vol as voltage1 ,inv0_pv2_vol as voltage2 ,inv0_pv1_cur as cur1 ,inv0_pv2_cur as cur2 ,inv0_pv1_power as power1 ,inv0_pv2_power as power2 ,inv0_event as event ,inv0_rphase as rphase ,inv0_yphase as yphase ,inv0_bphase as bphase  FROM inverter_ex_data_tbl order by updated_date_time desc limit 10 ")  

client.close();


  end

def inverter_search

client = Mysql2::Client.new(:host => "localhost", :username => "root", :password => "sql123", :database => "apexindia_solar1")

@fromdate=params[:fromdate]
@todate=params[:todate]
@inverter_name=params[:selinverter]
@inverter_ctrlrid=params[:controllerid]
#puts @fromdate


if @iverter_name==1
if (@fromdate =="" and @todate =="")

@selquery=client.query("select * from inverter_ex_data_tbl order by updated_date desc, updated_time desc Limit 1")
	if @selquery.count > 0
		@lastupdated_date=[];
		@selquery.each do |tim|
		@lastupdated_date.push(tim['updated_date'])
		end
#puts @lastupdated_date
		@inverter_data=client.query("select DATE_FORMAT(updated_time, '%H:%i:%s') as updated_time,DATE_FORMAT(updated_date, '%Y/%m/%d') as updated_date,concat(updated_date,updated_time) as updated_date_time,inv1_energy as energy ,inv1_kw_solar as solar_kw ,inv1_hrs_count as hrs_count ,inv1_pv1_vol as voltage1 ,inv1_pv2_vol as voltage2 ,inv1_pv1_cur as cur1 ,inv1_pv2_cur as cur2 ,inv1_pv1_power as power1 ,inv1_pv2_power as power2 ,inv1_event as event ,inv1_rphase as rphase ,inv1_yphase as yphase ,inv1_bphase as bphase  FROM inverter_ex_data_tbl where updated_date = '#{@lastupdated_date[0]}' AND ctrlr_serial_no = '#{@inverter_ctrlrid}' order by updated_date_time desc limit 10")

	else
		#puts "Record Not Found"			
	end
else
@inverter_data =client.query("select DATE_FORMAT(updated_time, '%H:%i:%s') as updated_time,DATE_FORMAT(updated_date, '%Y/%m/%d') as updated_date,concat(updated_date,updated_time) as updated_date_time,inv1_energy as energy ,inv1_kw_solar as solar_kw ,inv1_hrs_count as hrs_count ,inv1_pv1_vol as voltage1 ,inv1_pv2_vol as voltage2 ,inv1_pv1_cur as cur1 ,inv1_pv2_cur as cur2 ,inv1_pv1_power as power1 ,inv1_pv2_power as power2 ,inv1_event as event ,inv1_rphase as rphase ,inv1_yphase as yphase ,inv1_bphase as bphase  FROM inverter_ex_data_tbl where updated_date between  '#{@fromdate}' AND '#{@todate}' AND ctrlr_serial_no = '#{@inverter_ctrlrid}' order by updated_date_time desc")
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
		@inverter_data=client.query("select DATE_FORMAT(updated_time, '%H:%i:%s') as updated_time,DATE_FORMAT(updated_date, '%Y/%m/%d') as updated_date,concat(updated_date,updated_time) as updated_date_time,inv0_energy as energy ,inv0_kw_solar as solar_kw ,inv0_hrs_count as hrs_count ,inv0_pv1_vol as voltage1 ,inv0_pv2_vol as voltage2 ,inv0_pv1_cur as cur1 ,inv0_pv2_cur as cur2 ,inv0_pv1_power as power1 ,inv0_pv2_power as power2 ,inv0_event as event ,inv0_rphase as rphase ,inv0_yphase as yphase ,inv0_bphase as bphase  FROM inverter_ex_data_tbl where updated_date = '#{@lastupdated_date[0]}' AND ctrlr_serial_no = '#{@inverter_ctrlrid}' order by updated_date_time desc limit 10")

	else
		#puts "Record Not Found"			
	end
else
@inverter_data =client.query("Select DATE_FORMAT(updated_time, '%H:%i:%s') as updated_time,DATE_FORMAT(updated_date, '%Y/%m/%d') as updated_date,concat(updated_date,updated_time) as updated_date_time,inv0_energy as energy ,inv0_kw_solar as solar_kw ,inv0_hrs_count as hrs_count ,inv0_pv1_vol as voltage1 ,inv0_pv2_vol as voltage2 ,inv0_pv1_cur as cur1 ,inv0_pv2_cur as cur2 ,inv0_pv1_power as power1 ,inv0_pv2_power as power2 ,inv0_event as event ,inv0_rphase as rphase ,inv0_yphase as yphase ,inv0_bphase as bphase  FROM inverter_ex_data_tbl where updated_date between  '#{@fromdate}' AND '#{@todate}' AND ctrlr_serial_no = '#{@inverter_ctrlrid}'  order by updated_date_time desc")
end

end

client.close();
render 'inverter_report_view'
end




end
