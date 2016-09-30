include_recipe 'ruby_build'
include_recipe 'ruby_rbenv::user'

home = node['desktop']['user']['home']
user = node['desktop']['user']['name']

rbenv_script 'scripting-alias-rbenv' do
  code "rbenv alias scripting 2.3.1"
  creates "#{home}/.rbenv/versions/scripting"
  user user
  action :run
end

rbenv_script 'communize-all-gems' do
  code "rbenv communize --all"
  user user
  action :run
end

users = node[:rbenv][:user_installs]
rubies = node[:rbenv][:user_rubies]
gems =  node[:rbenv][:communal_gems].to_a

users.product(rubies, gems).each do |user, rubie, gem|
  rbenv_gem gem[0]+rubie+user[:user] do
    package_name gem[0]
    user user[:user]
    root_path user[:root_path] if user[:root_path]
    rbenv_version rubie

    %w(version action options source).each do |attr|
      send(attr, gem[1][attr]) if gem[1][attr]
    end
  end
end
