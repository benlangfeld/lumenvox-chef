include_recipe "lumenvox::core"

yum_package "LumenVoxClient" do
  version node['lumenvox']['client']['version']
end

template "/etc/lumenvox/client_property.conf" do
  source "client_property.conf.erb"
  variables(
    :license_servers          => node['lumenvox']['client']['license_servers'],
    :sre_servers              => node['lumenvox']['client']['sre_servers'],
    :tts_servers              => node['lumenvox']['client']['tts_servers'],
    :authentication_username  => node['lumenvox']['client']['authentication_username'] || ENV['LUMENVOX_USERNAME'],
    :authentication_password  => node['lumenvox']['client']['authentication_password'] || ENV['LUMENVOX_PASSWORD'],
    :default_tts_language     => node['lumenvox']['client']['default_tts_language'],
    :default_tts_gender       => node['lumenvox']['client']['default_tts_gender'],
    :default_tts_voice        => node['lumenvox']['client']['default_tts_voice']
  )
end
