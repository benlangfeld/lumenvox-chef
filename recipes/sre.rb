include_recipe "lumenvox::core"

yum_package "LumenVoxSRE" do
  version node['lumenvox']['sre']['version']
end

node['lumenvox']['sre']['language_packs'].each do |pack|
  yum_package "LumenVox-#{pack[:language]}SREModel" do
    version pack[:version]
  end
end

service "lvsred" do
  action :start
end
