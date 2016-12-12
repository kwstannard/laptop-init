include_recipe 'apt'

apt_repository 'postgresql' do
  uri 'http://apt.postgresql.org/pub/repos/apt/'
  components ['main']
  distribution 'jessie-pgdg'
  key 'pg.key'
  keyserver 'https://www.postgresql.org/media/keys/ACCC4CF8.asc'
end

pgpkgs = %w(
  postgresql
  postgresql-contrib
)
  #postgresql-client-9.6
  #postgresql-contrib-9.6
  #postgresql-common
  #postgresql-client-common
  #libpq5
  #libpq-dev
#)

#pgpkgs.each do |pkg|
  #apt_preference pkg do
    #pin 'release a=jessie-pgdg'
    #pin_priority '900'
  #end
#end

#cmnpgpkgs = [
  #'postgresql-common',
  #'postgresql-client-common',
#]

#package cmnpgpkgs do
  #version '177'
  #action :upgrade
#end
#apt_preference 'comerr-dev' do
  #pin 'release o=Debian Stretch'
  #pin_priority '900'
#end
#package 'comerr-dev' do
  #version '1.43.3'
  #action :upgrade
#end

package pgpkgs do
  action :upgrade
#package 'postgresql-9.6' do
end

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
