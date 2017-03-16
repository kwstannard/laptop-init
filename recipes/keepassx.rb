node.default['nodejs']['packages'].push 'npm'
include_recipe 'nodejs'

package 'keepassx'

link '/usr/local/bin/node' do
  to '/usr/bin/nodejs'
end

nodejs_npm "keepass-dmenu" do
  version '1.3.3'
end
