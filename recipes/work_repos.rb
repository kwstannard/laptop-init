u = node[:desktop][:user]

include_recipe 'laptop-init::git_wrapper'

node[:work][:repos].each do |r|
  path = File.join(u[:home], node[:work][:path], r[:name])

  r[:actions].each do |a|
    rbenv_script "#{r[:name]} #{a}" do
      code a
      cwd path
      user u[:name]
      environment ({
        "HOME" => u[:home],
        "USER" => u[:name],
      })
      action :nothing
      subscribes :run, "git[#{path}]", :immediately
    end
  end

  git path do
    user u[:name]
    group u[:group]
    repository node[:work][:repository] + r[:name]
    ssh_wrapper "/tmp/git_wrapper.sh"
  end
end
