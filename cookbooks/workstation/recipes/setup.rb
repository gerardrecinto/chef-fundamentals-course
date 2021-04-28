package 'vim-enhanced'
package 'emacs'
package 'nano'

package 'tree' do
  action :install
end

package 'git' do
  action :install
end

=begin
script 'host' do
  interpreter "bash"
  cwd ::File.dirname(src_filepath)
  code <<-EOH
    echo "Hostname: " $(hostname)
  EOH
end
=end

node['ipaddress']
node['memory']['total']

package 'ntp'
file '/etc/motd' do
  content "
  HOSTNAME: #{node['hostname']}
  IPADDRESS: #{node['ipaddress']}
  CPU: #{node['cpu']['0']['mhz']}
  MEMORY: #{node['memory']['total']}
"
  action :create
  owner 'root'
  group 'root'
end

