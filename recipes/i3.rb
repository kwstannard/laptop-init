include_recipe 'desktop::backports'

package [
  'scrot',
  'imagemagick'
]

apt_preference 'i3' do
  pin 'release o=Debian Backports'
  pin_priority '600'
end

package 'i3' do
  version '4.12-2~bpo8+1'
end

template "/usr/local/bin/i3" do
  source 'i3'
  owner node[:user]
  group node[:group]
  mode '0755'
end

template "/usr/local/bin/i3config-gen" do
  source 'i3config-gen'
  owner node[:user]
  group node[:group]
  mode '0755'
end
