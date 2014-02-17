# Description

Chef cookbook for Lumenvox media engine

# Requirements

## Platform:

* Redhat (>= 6.0)
* Centos (>= 6.0)

## Cookbooks:

* yum
* yum-repoforge

# Attributes

* `node['lumenvox']['core']['version']` - LumenVox core version to install. Defaults to ``.
* `node['lumenvox']['client']['version']` - LumenVox client version to install. Available options: `:upgrade`, `:install`. Defaults to `:upgrade`.
* `node['lumenvox']['client']['license_servers']` - This property sets which License Servers are used for obtaining licenses for Speech Recognition or TTS operations. Array of IP:port. Defaults to `['127.0.0.1:7569']`.
* `node['lumenvox']['client']['sre_servers']` - This property sets which Speech Recognition servers are used. Array of IP:port. Defaults to `['127.0.0.1:5730']`.
* `node['lumenvox']['client']['tts_servers']` - This property sets which Speech Synthesis servers are used. Array of IP:port. Defaults to `['127.0.0.1:7579']`.
* `node['lumenvox']['client']['default_tts_language']` - Default language for synthesis. Defaults to `default`.
* `node['lumenvox']['client']['default_tts_gender']` - The gender of the voice timbre of the audio. Defaults to `default`.
* `node['lumenvox']['client']['default_tts_voice']` - The processor-specific voice name of the audio produced. Defaults to `default`.
* `node['lumenvox']['client']['authentication_username']` - Username for fetching licenses from the license server. Defaults to `ENV["LUMENVOX_PASSWORD"]`.
* `node['lumenvox']['client']['authentication_password']` - Username for fetching licenses from the license server. Defaults to `ENV["LUMENVOX_USERNAME"]`.
* `node['lumenvox']['license_server']['version']` - LumenVox license server version to install. Defaults to ``.
* `node['lumenvox']['media_server']['version']` - LumenVox media server version to install. Defaults to ``.
* `node['lumenvox']['media_server']['mrcp_server_ip']` - Public IP of the MRCP server. Defaults to `default`.
* `node['lumenvox']['media_server']['enable_sre_logging']` - Enable or disable logging of response files in the Lang/Responses directory of of the Speech Recognition Engine. Available options: `0`, `1`, `2`, `3`. Defaults to `0`.
* `node['lumenvox']['media_server']['sre_ip']` - IP address of the machine that is running the SRE. Defaults to `default`.
* `node['lumenvox']['media_server']['sip_port']` - Sets the port on which the server will listen for incoming SIP messages. 0 = Disabled. Defaults to `default`.
* `node['lumenvox']['sre']['version']` - LumenVox SRE version to install. Defaults to ``.
* `node['lumenvox']['sre']['logging_verbosity']` - Controls the verbosity of event logging. This can be used to increase or decrease the amount of log events that are generated. Note that increasing logging verbosity uses more CPU, and should therefore be avoided wherever possible in production systems where optimal performance is critical. Available options: `1`, `2`, `3`. Defaults to `1`.
* `node['lumenvox']['sre']['language_packs']` - LumenVox SRE language packs to install.  Array of hashes providing :name and (optionally) :version. Defaults to `[]`.
* `node['lumenvox']['tts']['version']` - LumenVox TTS version to install. Defaults to ``.
* `node['lumenvox']['tts']['voices']` - LumenVox TTS voices to install. Array of hashes providing :name and (optionally) :version. Defaults to `[
  {:voice => "Jason",   :version => nil},
  {:voice => "Rebecca", :version => nil}
]`.

# Recipes

* lumenvox::default - Installs all Lumenvox components.
* lumenvox::core - Installs core files shared across all packages. This is required.
* lumenvox::client - Installs the Lumenvox speech client.
* lumenvox::sre - Installs the Lumenvox speech server.
* lumenvox::license_server - Installs the Lumenvox license server.
* lumenvox::media_server - Installs the Lumenvox media server which contains both the MRCPv1 and MRCPv2 Server.
* lumenvox::tts - Installs the text-to-speech server, required for a TTS installation.

# License and Maintainer

Maintainer:: Mojo Lingo LLC (<ops@mojolingo.com>)

License:: Apache 2.0
