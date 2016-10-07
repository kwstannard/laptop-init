package %w[
alien
]

path = node[:desktop][:user][:home] + "/Downloads/"

%w[
oracle-instantclient11.2-basic
oracle-instantclient11.2-devel
oracle-instantclient11.2-sqlplus
].each do |f|
  file_path = path + f + "-11.2.0.4.0-1.x86_64.rpm"
  final_path = path + f + "_11.2.0.4.0-2_amd64.deb"

  file final_path do
    action :create_if_missing
    owner node[:desktop][:user][:name]
    group node[:desktop][:user][:group]
    notifies :run, "execute[convert-to-deb-#{f}]", :immediately
  end

  execute "convert-to-deb-#{f}" do
    command "alien --to-deb #{file_path}"
    cwd path
    notifies :install, "dpkg_package[#{f}]", :immediately
    action :nothing
  end

  dpkg_package f do
    action :install
    source final_path
  end
end
