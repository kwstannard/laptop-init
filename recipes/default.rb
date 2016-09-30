#
# Cookbook Name:: laptop-init
# Recipe:: default
#
# Copyright (C) 2016 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'desktop::user'
#include_recipe 'desktop::apt'
#include_recipe 'desktop::tar'
#include_recipe 'desktop::pulseaudio'
#include_recipe 'desktop::slack'
#include_recipe 'desktop::vagrant'
#include_recipe 'desktop::virtualbox'
#include_recipe 'desktop::hub'

#include_recipe 'laptop-init::iwlwifi'
#include_recipe 'laptop-init::ruby'
include_recipe 'laptop-init::i3'

#package [
  #'vim',
#]

