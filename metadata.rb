maintainer        "Mojo Lingo LLC"
maintainer_email  "ops@mojolingo.com"
license           "Apache 2.0"
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           "0.2.0"
recipe            "lumenvox", "Installs all Lumenvox components."
recipe            "lumenvox::core", "Installs core files shared across all packages. This is required."
recipe            "lumenvox::client", "Installs the Lumenvox speech client."
recipe            "lumenvox::sre", "Installs the Lumenvox speech server."
recipe            "lumenvox::license_server", "Installs the Lumenvox license server."
recipe            "lumenvox::media_server", "Installs the Lumenvox media server which contains both the MRCPv1 and MRCPv2 Server."
recipe            "lumenvox::tts", "Installs the text-to-speech server, required for a TTS installation."

%w{ redhat centos }.each do |os|
  supports os, ">= 6.0"
end
