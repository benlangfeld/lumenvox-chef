include_recipe "lumenvox::core"

package "LumenVoxSRE"

node['lumenvox']['sre']['language_packs'].each do |language|
  package "LumenVox-#{language}SREModel"
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
