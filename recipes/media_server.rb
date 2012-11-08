include_recipe "lumenvox::core"

package "LumenVoxMediaServer"

template "/etc/lumenvox/media_server.conf" do
  source "media_server.conf.erb"
  variables(
    :mrcp_server_ip => node['lumenvox']['media_server']['mrcp_server_ip'],
    :sre_ip => node['lumenvox']['media_server']['sre_ip'],
    :sip_port => node['lumenvox']['media_server']['sip_port']
  )
end

service "lvmediaserverd" do
  action :start
end
