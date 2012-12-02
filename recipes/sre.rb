include_recipe "lumenvox::core"

yum_package "LumenVoxSRE" do
  version node['lumenvox']['sre']['version']
end

node['lumenvox']['sre']['language_packs'].each do |pack|
  yum_package "LumenVox-#{pack[:language]}SREModel" do
    version pack[:version]
  end
end

template "/etc/lumenvox/sre_server.conf" do
  source "sre_server.conf.erb"
  variables(
    :logging_verbosity => node['lumenvox']['sre']['logging_verbosity']
  )
  notifies :restart, "service[lvsred]"
end

service "lvsred" do
  action :start
end
