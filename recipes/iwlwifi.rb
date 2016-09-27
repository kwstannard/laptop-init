include_recipe 'debian'
package 'firmware-linux-nonfree' do
  action :upgrade
  notifies :run, 'execute[reload-iwlwifi-module]'
end

execute 'reload-iwlwifi-module' do
  command 'depmod -a; modprobe -r iwlwifi; modprobe iwlwifi'
  action :nothing
end
