#
# Cookbook Name:: ntrights
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

ntrights_account 'vagrant' do
  right ['SeServiceLogonRight', 'SeBackupPrivilege']
end    
