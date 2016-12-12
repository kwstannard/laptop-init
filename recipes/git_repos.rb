include_recipe 'laptop-init::git_wrapper'

node[:git_repos].each do |path,info|
  root_path = File.join(node[:home], path)
  directory root_path do
    recursive true
    user node[:user]
    group node[:group]
  end

  info[:repos].each do |r|
    repo_path = File.join(root_path, r[:name])
    postfix = r[:postfix] || r[:name]

    actions = info[:actions]
    r.fetch(:actions, []).each do |a|
      rbenv_script "#{r[:name]} #{a}" do
        code a
        cwd repo_path
        user node[:user]
        environment ({
          "HOME" => node[:home],
          "USER" => node[:user],
        })
        action :nothing
        subscribes :run, "git[#{repo_path}]", :immediately
      end
    end

    git repo_path do
      user node[:user]
      group node[:group]
      enable_checkout false
      repository "#{info[:repository]}#{postfix}"
      revision "master"
      ssh_wrapper "/tmp/git_wrapper.sh"
    end
  end
end
