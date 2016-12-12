include_recipe 'apt'

execute 'apt-key adv --keyserver keys.gnupg.net --recv-keys 09617FD37CC06B54'

apt_repository 'crystallang' do
  uri 'https://dist.crystal-lang.org/apt'
  components ['main']
  distribution 'crystal'
  notifies :run, 'execute[apt-get update]', :immediately
end

package 'crystal' do
  action :upgrade
end
