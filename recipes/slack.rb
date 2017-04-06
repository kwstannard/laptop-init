include_recipe 'desktop::slack'

comms_path = File.join(node[:home], "bin", "check_comms")

cookbook_file comms_path do
  owner node[:user]
  group node[:group]
  source 'check_comms_slack'
  mode '755'
end

cron 'check_comms' do
  command "#{comms_path}"
  environment({"DISPLAY" => ":0"})
  minute "0"
  hour "10-19"
  day "*"
  month "*"
  weekday "1-5"
  user node[:user]
end
