dir = File.join(node[:desktop][:user][:home], '.mozilla', 'firefox', '3expduhd.default')

template File.join(dir, "extensions.json") do
  owner node[:user]
  group node[:group]
  source "extensions.json.erb"
  variables node: node
end
template File.join(dir, "extensions.ini") do
  owner node[:user]
  group node[:group]
  source "extensions.ini.erb"
  variables node: node
end

dir = File.join(node[:home], '.vimperator', 'plugin')
directory dir do
  owner node[:user]
  group node[:group]
end

remote_file File.join(dir, 'pocket_integration.js') do
  owner node[:user]
  group node[:group]
  source 'https://raw.githubusercontent.com/vimpr/vimperator-plugins/4e5270c9d46f517d156b1f248be90392f84efd41/pocket_integration.js'
  action :create_if_missing
end
