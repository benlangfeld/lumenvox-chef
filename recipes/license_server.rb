include_recipe "lumenvox::core"

yum_package "LumenVoxLicenseServer" do
  version node['lumenvox']['license_server']['version']
end

service "lvlicensed" do
  action :start
end
