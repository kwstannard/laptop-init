include_recipe 'desktop::backports'

package [
  'scrot',
  'imagemagick'
]

package 'i3' do
  version '4.12'
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
