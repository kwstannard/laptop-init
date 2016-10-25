file "/tmp/git_wrapper.sh" do
  owner node[:user]
  mode "0755"
  content "#!/bin/sh\nexec /usr/bin/ssh -i #{node[:home]}/.ssh/id_rsa \"$@\""
end
