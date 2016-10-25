private_bashrc = ""
node[:private_env_vars].each {|k,v| private_bashrc += "export #{k}=\"#{v}\""}
file "#{node[:desktop][:user][:home]}/.private_bashrc" do
  content private_bashrc
end
