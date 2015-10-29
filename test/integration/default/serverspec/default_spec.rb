require 'spec_helper'

describe command('c:\ntrights\showpriv.exe SeServiceLogonRight') do
  its(:stdout) { should match(/testuser1/) }
  its(:stdout) { should_not match(/testuser2/) }
end

describe command('c:\ntrights\showpriv.exe SeBackupPrivilege') do
  its(:stdout) { should match(/testuser1/) }
  its(:stdout) { should_not match(/testuser2/) }
end
