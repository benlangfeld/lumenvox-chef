include_recipe "lumenvox::core"

package "LumenVoxMediaServer"

service "lvmediaserverd" do
  action :start
end
