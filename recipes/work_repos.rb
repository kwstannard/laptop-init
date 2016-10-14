u = node[:desktop][:user]

file "/tmp/git_wrapper.sh" do
  owner u[:name]
  mode "0755"
  content "#!/bin/sh\nexec /usr/bin/ssh -i #{u[:home]}/.ssh/id_rsa \"$@\""
end

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
