apt_preference 'mysql-client' do
  pin 'version 5.5.53-0+deb8u1'
  pin_priority '700'
end
apt_preference 'libvlccore8' do
  pin 'version 2.2.4'
  pin_priority '700'
end
package 'libmysqlclient-dev'
package 'mysql-client' do
  action :upgrade
end
