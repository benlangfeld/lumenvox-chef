include_recipe "lumenvox::core"

yum_package "LumenVoxTTS" do
  version node['lumenvox']['tts']['version']
end

node['lumenvox']['tts']['voices'].each do |item|
  yum_package "LumenVox-#{item[:voice]}-VoiceDB" do
    version item[:version]
  end
end

service "lvttsd" do
  action :start
end
