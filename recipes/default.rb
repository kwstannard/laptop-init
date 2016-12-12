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
#require 'pry'; binding.pry
include_recipe 'dropbox'
include_recipe 'desktop::apt'
include_recipe 'desktop::tar'
include_recipe 'desktop::pulseaudio'
#include_recipe 'desktop::slack'
include_recipe 'desktop::vagrant'
include_recipe 'desktop::virtualbox'
include_recipe 'desktop::hub'
include_recipe 'desktop::ssh'
include_recipe 'desktop::synaptics'

# TODO make sure correct 4.12 installs
include_recipe 'laptop-init::i3'
#include_recipe 'laptop-init::prax'

#DONE
#include_recipe 'laptop-init::firefox'
include_recipe 'laptop-init::ruby'
include_recipe 'laptop-init::iwlwifi'
include_recipe 'laptop-init::googletalk'
include_recipe 'laptop-init::screen_locking'
include_recipe 'laptop-init::x'
#include_recipe 'laptop-init::private_bashrc'
#include_recipe 'laptop-init::googlefont'
include_recipe 'laptop-init::fzf'
include_recipe 'laptop-init::pg'
include_recipe 'laptop-init::mysql'
include_recipe 'laptop-init::crystallang'
#include_recipe 'laptop-init::oracle_instant_client'

package [ # base packages
  'xbacklight',
  'recode',
  'fonts-symbola',
  'fonts-freefont-otf',
  'fonts-freefont-ttf',
  'libnotify-bin',
  'xsel',
  'pavucontrol',
  'chromium',
  'pciutils',
#  'kde-plasma-netbook',
]

package [ #work packages
  'nodejs',
  'redis-server',
  'libpq-dev',
  'jq',
  'rabbitmq-server',
]

package [ # personal packages
  'pidgin',
  'vim-gtk',
  'keepassx',
]
include_recipe 'desktop::heroku'
include_recipe 'laptop-init::git_repos'

execute "update-alternatives --set x-www-browser $(update-alternatives --list x-www-browser | grep #{node[:desktop][:browser]})"
