include_recipe 'laptop-init::git_wrapper'

directory File.join(node[:home], node[:work][:path]) do
  user node[:user]
  group node[:group]
end

node[:work][:repos].each do |r|
  path = File.join(node[:home], node[:work][:path], r[:name])

  r[:actions].each do |a|
    rbenv_script "#{r[:name]} #{a}" do
      code "echo HELLO WORLD; #{a}"
      cwd path
      user node[:user]
      environment ({
        "HOME" => node[:home],
        "USER" => node[:user],
      })
      action :nothing
      subscribes :run, "git[#{path}]", :immediately
    end
  end

  git path do
    user node[:name]
    group node[:group]
    repository node[:work][:repository] + r[:name]
    ssh_wrapper "/tmp/git_wrapper.sh"
  end
end
