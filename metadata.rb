name              "lumenvox"
maintainer        "Mojo Lingo LLC"
maintainer_email  "ops@mojolingo.com"
license           "Apache 2.0"
description       "Chef cookbook for Lumenvox media engine"
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           "0.1.1"

depends "yum"
depends "yum-repoforge"

%w{ redhat centos }.each do |os|
  supports os, ">= 6.0"
end

recipe "lumenvox::default", "Installs all Lumenvox components."
recipe "lumenvox::core", "Installs core files shared across all packages. This is required."
recipe "lumenvox::client", "Installs the Lumenvox speech client."
recipe "lumenvox::sre", "Installs the Lumenvox speech server."
recipe "lumenvox::license_server", "Installs the Lumenvox license server."
recipe "lumenvox::media_server", "Installs the Lumenvox media server which contains both the MRCPv1 and MRCPv2 Server."
recipe "lumenvox::tts", "Installs the text-to-speech server, required for a TTS installation."

grouping 'lumenvox/core',
 title: "Options relevant to the core of LumenVox"

attribute 'lumenvox/core/version',
 display_name: "LumenVox core version",
 description: "LumenVox core version to install",
 type: "string",
 required: "optional",
 recipes: ['lumenvox::default', 'lumenvox::core'],
 default: nil

grouping 'lumenvox/client',
 title: "Options relevant to the LumenVox client "

attribute 'lumenvox/client/version',
 display_name: "LumenVox client version",
 description: "LumenVox client version to install",
 choice: [':upgrade', ':install'],
 type: "symbol",
 required: "optional",
 recipes: ['lumenvox::client'],
 default: ':upgrade'

attribute 'lumenvox/client/license_servers',
 display_name: "License servers",
 description: "This property sets which License Servers are used for obtaining licenses for Speech Recognition or TTS operations. Array of IP:port.",
 type: "array",
 required: "optional",
 recipes: ['lumenvox::client'],
 default: "['127.0.0.1:7569']"

attribute 'lumenvox/client/sre_servers',
 display_name: "SRE servers",
 description: "This property sets which Speech Recognition servers are used. Array of IP:port.",
 type: "array",
 required: "optional",
 recipes: ['lumenvox::client'],
 default: "['127.0.0.1:5730']"

attribute 'lumenvox/client/tts_servers',
 display_name: "TTS servers",
 description: "This property sets which Speech Synthesis servers are used. Array of IP:port.",
 type: "array",
 required: "optional",
 recipes: ['lumenvox::client'],
 default: "['127.0.0.1:7579']"

attribute 'lumenvox/client/default_tts_language',
 display_name: "Default TTS Language",
 description: "Default language for synthesis",
 type: "string",
 required: "optional",
 recipes: ['lumenvox::client'],
 default: 'default'

attribute 'lumenvox/client/default_tts_gender',
 display_name: "Default TTS Gender",
 description: "The gender of the voice timbre of the audio",
 type: "string",
 required: "optional",
 recipes: ['lumenvox::client'],
 default: 'default'

attribute 'lumenvox/client/default_tts_voice',
 display_name: "Default TTS Voice",
 description: "The processor-specific voice name of the audio produced",
 type: "string",
 required: "optional",
 recipes: ['lumenvox::client'],
 default: 'default'

attribute 'lumenvox/client/authentication_username',
 display_name: "Authentication Username",
 description: "Username for fetching licenses from the license server",
 type: "string",
 required: "optional",
 recipes: ['lumenvox::client'],
 default: 'ENV["LUMENVOX_PASSWORD"]'

attribute 'lumenvox/client/authentication_password',
 display_name: "Authentication Password",
 description: "Username for fetching licenses from the license server",
 type: "string",
 required: "optional",
 recipes: ['lumenvox::client'],
 default: 'ENV["LUMENVOX_USERNAME"]'

grouping 'lumenvox/license_server',
 title: "Options relevant to the LumenVox license server"

attribute 'lumenvox/license_server/version',
 display_name: "LumenVox license server version",
 description: "LumenVox license server version to install",
 type: "string",
 required: "optional",
 recipes: ['lumenvox::license_server'],
 default: nil

grouping 'lumenvox/media_server',
 title: "Options relevant to the LumenVox media server"

attribute 'lumenvox/media_server/version',
 display_name: "LumenVox media server version",
 description: "LumenVox media server version to install",
 type: "string",
 required: "optional",
 recipes: ['lumenvox::media_server'],
 default: nil

attribute 'lumenvox/media_server/mrcp_server_ip',
 display_name: "LumenVox media server MRCP server IP",
 description: "Public IP of the MRCP server",
 type: "string",
 required: "required",
 recipes: ['lumenvox::media_server'],
 default: 'default'

attribute 'lumenvox/media_server/enable_sre_logging',
 display_name: "LumenVox media server SRE logging",
 description: "Enable or disable logging of response files in the Lang/Responses directory of of the Speech Recognition Engine.",
 choice: %w{0 1 2 3},
 type: "string",
 required: "optional",
 recipes: ['lumenvox::media_server'],
 default: '0'

attribute 'lumenvox/media_server/sre_ip',
 display_name: "LumenVox media server SRE IP",
 description: "IP address of the machine that is running the SRE.",
 type: "string",
 required: "optional",
 recipes: ['lumenvox::media_server'],
 default: 'default'

attribute 'lumenvox/media_server/sip_port',
 display_name: "LumenVox media server SIP port",
 description: "Sets the port on which the server will listen for incoming SIP messages. 0 = Disabled.",
 type: "string",
 required: "optional",
 recipes: ['lumenvox::media_server'],
 default: 'default'

grouping 'lumenvox/sre',
 title: "Options relevant to the LumenVox Speech Recognition Engine"

attribute 'lumenvox/sre/version',
 display_name: "LumenVox SRE version",
 description: "LumenVox SRE version to install",
 type: "string",
 required: "optional",
 recipes: ['lumenvox::sre'],
 default: nil

attribute 'lumenvox/sre/logging_verbosity',
 display_name: "LumenVox SRE logging verbosity",
 description: "Controls the verbosity of event logging. This can be used to increase or decrease the amount of log events that are generated. Note that increasing logging verbosity uses more CPU, and should therefore be avoided wherever possible in production systems where optimal performance is critical",
 choice: %w{1 2 3},
 type: "string",
 required: "optional",
 recipes: ['lumenvox::sre'],
 default: '1'

attribute 'lumenvox/sre/language_packs',
 display_name: "LumenVox SRE language packs",
 description: "LumenVox SRE language packs to install.  Array of hashes providing :name and (optionally) :version",
 type: "array",
 required: "optional",
 recipes: ['lumenvox::sre'],
 default: '[]'

grouping 'lumenvox/tts',
 title: "Options relevant to the LumenVox Text-to-Speech server"

attribute 'lumenvox/tts/version',
 display_name: "LumenVox TTS version",
 description: "LumenVox TTS version to install",
 type: "string",
 required: "optional",
 recipes: ['lumenvox::tts'],
 default: nil

attribute 'lumenvox/tts/voices',
 display_name: "LumenVox TTS voices",
 description: "LumenVox TTS voices to install. Array of hashes providing :name and (optionally) :version",
 type: "array",
 required: "optional",
 recipes: ['lumenvox::tts'],
 default: '[
  {:voice => "Chris",   :version => nil},
  {:voice => "Lindsey", :version => nil}
]'
