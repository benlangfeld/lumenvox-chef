include_recipe "lumenvox::core"

package "LumenVoxLicenseServer"

service "lvlicensed" do
  action :start
end
