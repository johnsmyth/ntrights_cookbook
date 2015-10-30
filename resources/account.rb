actions :grant, :revoke
default_action :grant

attribute :user_name, kind_of: String,  name_attribute: true, required: true
attribute :right, kind_of: [Array, String], required: true #, equal_to: %w(async sync )
attribute :install_dir, kind_of: [Array, String], default: "#{ENV['systemdrive']}\\ntrights"


# The following is a list of logon user rights that you can modify by using the NTRights utility.
# User Right	Explanation
# SeNetworkLogonRight	Access this computer from the network
# SeInteractiveLogonRight	Log on locally
# SeBatchLogonRight	Log on as a batch job
# SeServiceLogonRight	Log on as a service
# SeDenyNetworkLogonRight	Deny access this computer from the network
# SeDenyInteractiveLogonRight	Deny log on locally
# SeDenyBatchLogonRight	Deny log on as a batch job
# SeDenyServiceLogonRight	Deny log on as a service
# SeCreateGlobalPrivilege	Create global objects
# SeDebugPrivilege	Debug programs
# SeDenyRemoteInteractiveLogonRight	Deny log on through Terminal Services
# SeEnableDelegationPrivilege	Enable computer and user accounts to be trusted for delegation
# SeImpersonatePrivilege	Impersonate a client after authentication
# SeManageVolumePrivilege	Perform volume maintenance tasks
# SeRemoteInteractiveLogonRight	Allow log on through Terminal Services
# SeSyncAgentPrivilege	Synchronize directory service data
# SeUndockPrivilege	Remove computer from docking station
