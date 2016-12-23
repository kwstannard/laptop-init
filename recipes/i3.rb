include_recipe 'desktop::backports'

package [
  'scrot',
  'imagemagick',
  'dunst',
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

directory File.join(node[:home], ".config", "dunst") { recursive true }

file File.join(node[:home], ".config", "dunst", "dunstrc") do
  action :create_if_missing
  content `gunzip -c /usr/share/doc/dunst/dunstrc.example.gz`
  owner node[:user]
  group node[:group]
end

directory File.join(node[:home], ".config", "i3status") { recursive true }
cookbook_file File.join(node[:home], '.config', 'i3status', 'config') do
  owner node[:user]
  group node[:group]
  source 'i3status-config'
end
