include_recipe "lumenvox::core"

package "LumenVoxTTS"

node['lumenvox']['tts']['voices'].each do |voice|
  package "LumenVox-#{voice}-VoiceDB"
end

service "lvttsd" do
  action :start
end
