include_recipe "laptop-init::git_wrapper"

path = File.join(node[:remote_sources_dir], 'googlecode')
font_path = File.join(node[:home], '.fonts')

git path do
  user node[:user]
  group node[:group]
  repository "https://github.com/google/fonts.git"
  ssh_wrapper "/tmp/git_wrapper.sh"
end

directory font_path do
  owner node[:user]
  group node[:group]
  recursive true
end

link File.join(font_path, 'truetype') do
  owner node[:user]
  group node[:group]
  to File.join(path, "ofl")
end
