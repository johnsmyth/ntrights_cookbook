actions :grant, :revoke
default_action :grant

attribute :user_name, kind_of: String,  name_attribute: true, required: true
attribute :right, kind_of: [Array, String], required: true #, equal_to: %w(async sync )
attribute :install_dir, kind_of: [Array, String], default: "#{ENV['systemdrive']}\\ntrights"
