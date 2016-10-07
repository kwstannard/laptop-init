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

# TODO make sure correct 4.12 installs
#include_recipe 'laptop-init::i3'
## TODO download files from remote
#include_recipe 'laptop-init::oracle_instant_client'

#DONE
#include_recipe 'laptop-init::ruby'
#include_recipe 'laptop-init::pg'
#include_recipe 'laptop-init::iwlwifi'
#include_recipe 'laptop-init::googletalk'
#include_recipe 'laptop-init::prax'

package [
  #'libpq-dev',
  #'vim-gtk',
  #'nodejs',
  #'redis-server',
  #'libnotify-bin',
  #'xsel',
  #'dunst',
  #'keepassx',
  #'pavucontrol',
]
