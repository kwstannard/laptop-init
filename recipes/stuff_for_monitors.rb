cookbook_file File.join(node[:home], 'bin', 'monitor_reset') do
  owner node[:user]
  group node[:group]
  source 'monitor_reset'
  mode '0771'
end
