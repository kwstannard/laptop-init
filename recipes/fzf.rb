include_recipe 'laptop-init::git_wrapper'

git File.join(node['home'], '.fzf') do
  user node['user']
  group node['group']
  repository 'https://github.com/junegunn/fzf.git'
  ssh_wrapper "/tmp/git_wrapper.sh"
end

execute File.join(node['home'],'.fzf','install') + ' --all' do
  user node[:user]
  group node[:group]
  environment({
    'HOME' => node[:home],
    'USER' => node[:user],
  })
  action :run
end
