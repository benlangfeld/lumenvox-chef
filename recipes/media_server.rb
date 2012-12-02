include_recipe "lumenvox::core"

yum_package "LumenVoxMediaServer" do
  version node['lumenvox']['media_server']['version']
end

template "/etc/lumenvox/media_server.conf" do
  source "media_server.conf.erb"
  variables(
    :mrcp_server_ip     => node['lumenvox']['media_server']['mrcp_server_ip'],
    :enable_sre_logging => node['lumenvox']['media_server']['enable_sre_logging'],
    :sre_ip             => node['lumenvox']['media_server']['sre_ip'],
    :sip_port           => node['lumenvox']['media_server']['sip_port']
  )
  notifies :restart, "service[lvmediaserverd]"
end

service "lvmediaserverd" do
  action :start
end
