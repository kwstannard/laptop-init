include_recipe 'ruby_build'
include_recipe 'ruby_rbenv::system'

#rbenv_global node.default[:rbenv][:rubies].last
