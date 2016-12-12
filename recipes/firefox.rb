dir = File.join(node[:desktop][:user][:home], '.mozilla', 'firefox', 'kwstannard.default')
directory dir do
  recursive true
  owner node[:user]
  group node[:group]
end

cookbook_file File.join(dir, "..", "profiles.ini") do
  owner node[:user]
  group node[:group]
  source "firefox_profiles.ini"
end

template File.join(dir, "extensions.json") do
  owner node[:user]
  group node[:group]
  source "extensions.json.erb"
  variables home: node[:home]
end
template File.join(dir, "extensions.ini") do
  owner node[:user]
  group node[:group]
  source "extensions.ini.erb"
  variables home: node[:home]
end

dir = File.join(node[:home], '.vimperator', 'plugin')
directory dir do
  recursive true
  owner node[:user]
  group node[:group]
end

remote_file File.join(dir, 'pocket_integration.js') do
  owner node[:user]
  group node[:group]
  source 'https://raw.githubusercontent.com/vimpr/vimperator-plugins/4e5270c9d46f517d156b1f248be90392f84efd41/pocket_integration.js'
  action :create_if_missing
end
