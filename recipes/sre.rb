include_recipe "lumenvox::core"

package "LumenVoxSRE"

node['lumenvox']['sre']['language_packs'].each do |language|
  package "LumenVox-#{language}SREModel"
end
