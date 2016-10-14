#
# Cookbook Name:: laptop-init
# Recipe:: default
#
# Copyright (C) 2016 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'desktop::user'
#include_recipe 'desktop::fonts'
#include_recipe 'dropbox'
#include_recipe 'desktop::apt'
#include_recipe 'desktop::tar'
#include_recipe 'desktop::pulseaudio'
#include_recipe 'desktop::slack'
#include_recipe 'desktop::vagrant'
#include_recipe 'desktop::virtualbox'
#include_recipe 'desktop::hub'
#include_recipe 'desktop::ssh'
#include_recipe 'desktop::synaptics'

# TODO make sure correct 4.12 installs
include_recipe 'laptop-init::i3'
## TODO download files from remote
#include_recipe 'laptop-init::oracle_instant_client'
#include_recipe 'laptop-init::prax'
# TODO synaptics settings

#DONE
#include_recipe 'laptop-init::firefox'
#include_recipe 'laptop-init::ruby'
#include_recipe 'laptop-init::pg'
#include_recipe 'laptop-init::iwlwifi'
#include_recipe 'laptop-init::googletalk'
#include_recipe 'laptop-init::screen_locking'

package [
  'xbacklight',
  'recode',
  'fonts-symbola',
  'fonts-freefont-otf',
  'fonts-freefont-ttf',
  'pidgin',
  'libpq-dev',
  'vim-gtk',
  'nodejs',
  'redis-server',
  'libnotify-bin',
  'xsel',
  'dunst',
  'keepassx',
  'pavucontrol',
]

private_bashrc = ""
node[:private_env_vars].each {|k,v| private_bashrc += "export #{k}=\"#{v}\""}
file "#{node[:desktop][:user][:home]}/.private_bashrc" do
  content private_bashrc
end

#include_recipe 'desktop::heroku'
#include_recipe 'laptop-init::work_repos'
