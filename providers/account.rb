use_inline_resources

#include Chef::Mixin::ShellOut

def whyrun_supported?
  true
end

action :grant do
  grant_rights
end

action :revoke do
  revoke_rights
end

def load_current_resource
end

private

def grant_rights

  directory new_resource.install_dir do
    action :create
  end

  ntrights_exe = "#{new_resource.install_dir}\\ntrights.exe"
  cookbook_file ntrights_exe do
    source 'ntrights.exe'
    action :create
    cookbook 'ntrights'
  end

  showpriv_exe = "#{new_resource.install_dir}\\showpriv.exe"
  cookbook_file showpriv_exe do
    source 'showpriv.exe'
    action :create
    cookbook 'ntrights'
  end

  rights = []
  if new_resource.right.kind_of?(String)
    rights << new_resource.right
  else
    rights = new_resource.right
  end 

  rights.each do |right_name|
    execute "#{ntrights_exe} -u #{new_resource.user_name} +r #{right_name}" do
      action :run
      not_if "#{showpriv_exe} #{right_name} | findstr /i #{new_resource.user_name}"
    end 
  end
end

def revoke_rights

  directory new_resource.install_dir do
    action :create
  end

  ntrights_exe = "#{new_resource.install_dir}\\ntrights.exe"
  cookbook_file ntrights_exe do
    source 'ntrights.exe'
    action :create
    cookbook 'ntrights'
  end

  showpriv_exe = "#{new_resource.install_dir}\\showpriv.exe"
  cookbook_file showpriv_exe do
    source 'showpriv.exe'
    action :create
    cookbook 'ntrights'
  end

  rights = []
  if new_resource.right.kind_of?(String)
    rights << new_resource.right
  else
    rights = new_resource.right
  end 

  rights.each do |right_name|
    execute "#{ntrights_exe} -u #{new_resource.user_name} -r #{right_name}" do
      action :run
      only_if "#{showpriv_exe} #{right_name} | findstr /i #{new_resource.user_name}"
    end 
  end
end

