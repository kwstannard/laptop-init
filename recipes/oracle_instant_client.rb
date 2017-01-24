# I hope you have the oracleic files handy

package %w[
alien
]

path = File.join(node['home'], 'pkgs', "oracleic")
file_prefix = "oracle-instantclient11.2-"
file_suffix = "-11.2.0.4.0-1.x86_64.rpm"

%w[
basic
devel
sqlplus
].each do |f|
  file_path = File.join(path, file_prefix + f + file_suffix)
  final_path = File.join(path, file_prefix + f + "_11.2.0.4.0-2_amd64.deb")

  execute "alien --to-deb #{file_path}" do
    cwd path
    action :nothing
  end

  package file_prefix + f do
    notifies :run, "execute[alien --to-deb #{file_path}]", :before
    provider Chef::Provider::Package::Dpkg
    source final_path
  end
end
