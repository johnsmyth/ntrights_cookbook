#
# Cookbook Name:: ntrights
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.


user 'testuser1' do
  action :create
end

ntrights_account 'testuser1' do
  right ['SeServiceLogonRight', 'SeBackupPrivilege']
end    

user 'testuser2' do
  action :create
end

ntrights_account 'testuser2' do
  right ['SeServiceLogonRight', 'SeBackupPrivilege']
end    

ntrights_account 'testuser2' do
  action :revoke
  right ['SeServiceLogonRight', 'SeBackupPrivilege']
end    
