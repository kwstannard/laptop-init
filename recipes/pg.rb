package [
  'postgresql',
  'postgresql-client',
  'postgresql-contrib',
]

name = node[:desktop][:user][:name]

execute "setup-postgres-user" do
  not_if "sudo -u postgres psql -c \"SELECT 1 FROM pg_user WHERE usename = '#{name}'\" | grep -q 1"
  command "sudo -u postgres psql -c 'CREATE USER #{name} SUPERUSER'"
  action :run
end

execute "setup-postgres-database" do
  not_if "sudo -u postgres psql -c \"SELECT 1 FROM pg_database WHERE datname = '#{name}'\" | grep -q 1"
  command "sudo -u postgres psql -c 'CREATE DATABASE #{name}'"
  action :run
end
