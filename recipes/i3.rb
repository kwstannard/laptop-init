include_recipe 'desktop::backports'

package [
  'scrot',
  'imagemagick',
  'dunst',
]

apt_preference 'i3' do
  glob 'i3*'
  pin 'release o=Debian Backports'
  pin_priority '900'
end
package %w(i3 i3status)

require_relative '../templates/default/i3config-gen'
file File.join(node[:home], ".config", "i3", "config") do
  content I3ConfigGen.call
  owner node[:user]
  group node[:group]
  mode '0755'
end

directory File.join(node[:home], ".config", "dunst") {
  owner node[:user]
  group node[:group]
  recursive true
}

cookbook_file File.join(node[:home], ".config", "dunst", "dunstrc") do
  owner node[:user]
  group node[:group]
  source 'dunstrc'
end

cookbook_file File.join(node[:home], "bin", "cron_env_setup") do
  owner node[:user]
  group node[:group]
  source 'cron_env_setup'
  mode '755'
end

directory File.join(node[:home], ".config", "i3status") {
  recursive true
  owner node[:user]
  group node[:group]
}
cookbook_file File.join(node[:home], '.config', 'i3status', 'config') do
  owner node[:user]
  group node[:group]
  source 'i3status-config'
end
