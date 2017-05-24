#
# Cookbook Name:: laptop-init
# Recipe:: default
#
# Copyright (C) 2016 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#


include_recipe 'desktop::user'
include_recipe 'desktop::fonts'
include_recipe 'dropbox'
include_recipe 'desktop::apt'
include_recipe 'desktop::tar'
include_recipe 'desktop::pulseaudio'
include_recipe 'laptop-init::slack'
include_recipe 'desktop::vagrant'
include_recipe 'desktop::virtualbox'
include_recipe 'desktop::hub'
include_recipe 'desktop::ssh'
include_recipe 'desktop::synaptics'

## TODO make sure correct 4.12 installs
#include_recipe 'laptop-init::prax'
#include_recipe 'laptop-init::libxrandr'

##DONE
#include_recipe 'laptop-init::firefox'
include_recipe 'laptop-init::ruby'
include_recipe 'laptop-init::iwlwifi'
include_recipe 'laptop-init::googletalk'
#include_recipe 'laptop-init::screen_locking'
include_recipe 'laptop-init::x'
#include_recipe 'laptop-init::private_bashrc'
##include_recipe 'laptop-init::googlefont'
include_recipe 'laptop-init::fzf'
include_recipe 'laptop-init::pg'
include_recipe 'laptop-init::mysql'
include_recipe 'laptop-init::crystallang'
include_recipe 'laptop-init::oracle_instant_client'
include_recipe 'laptop-init::stuff_for_monitors'
include_recipe 'laptop-init::tmux'
include_recipe 'laptop-init::keepassx'
include_recipe 'laptop-init::i3'

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
]

package [ #work packages
  'nodejs',
  'redis-server',
  'libpq-dev',
  'jq',
  'rabbitmq-server',
  'dmg2img',
]

package [ # personal packages
  'pidgin',
  'vim-gtk',
]
include_recipe 'desktop::heroku'
#include_recipe 'laptop-init::git_repos'

execute "update-alternatives --set x-www-browser $(update-alternatives --list x-www-browser | grep #{node[:desktop][:browser]})"
