Rails.application.routes.draw do

  #get 'login' => 'login#login_view'

#loging routes

get 'login' => 'login#login_view'
match 'loginpost' => 'login#login', via: :post

#report routes 

  get 'energy_report' => 'energy_report#energy_report_view'
  get 'energy_search' =>  'energy_report#energy_search'
  get 'invert_report' => 'inverter_report#inverter_report_view'
  get 'inverter_search' => 'inverter_report#inverter_search'

  get 'report' => 'report#report_view'
  get 'report_search' => 'report#report_search'

#admin report routes

  get 'inverter_report_admin' => 'inverter_report_admin#inv_rpt_admin_view'
  get 'inverter_search_admin' => 'inverter_report_admin#inverter_search_admin'

  get 'energy_report_admin' => 'energy_report_admin#energy_report_admin_view'
  get 'energy_search_admin' => 'energy_report_admin#energy_search_admin'

  get 'report_admin' => 'report_admin#report_admin_view'
  get 'report_admin_search' => 'report_admin#report_admin_search'


#logout routes

  get 'logout' => 'logout#logout_view'

#dashboard route

  get 'dashboard' => 'dashboard#dashboard_view'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
