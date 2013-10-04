default['lumenvox']['core']['version'] = '10.5.300-1.el6'

default['lumenvox']['sre']['version']           =  '10.5.300-1.el6'
default['lumenvox']['sre']['logging_verbosity'] = 1
default['lumenvox']['sre']['language_packs']    = [
                                                    { :language => "MexicanSpanish",    :version => '10.5.110-1'},
                                                    { :language => "ColombianSpanish",  :version => '10.5.110-1'},
                                                    { :language => "CanadianFrench",    :version => '10.5.110-1'},
                                                    { :language => "BritishEnglish",    :version => '10.5.110-1'},
                                                    { :language => "AustralianEnglish", :version => '10.5.110-1'}
                                                  ]

default['lumenvox']['tts']['version'] = '10.5.300-2SF.el6'
default['lumenvox']['tts']['voices']  = [
                                          {:voice => "Jason",   :version => '10.5.110-1'},
                                          {:voice => "Rebecca", :version => '10.5.110-1'},
                                          {:voice => "Rita",    :version => '10.5.110-1'},
                                          {:voice => "Sophie",  :version => '10.5.110-1'},
                                          {:voice => "Chris",   :version => '10.5.110-1'},
                                          {:voice => "Lindsey", :version => '10.5.110-1'},
                                          {:voice => "Ben",     :version => '10.5.110-1'},
                                          {:voice => "Chloe",   :version => '10.5.110-1'},
                                          {:voice => "Lukas",   :version => '10.5.110-1'},
                                          {:voice => "Heidi",   :version => '10.5.110-1'},
                                          {:voice => "Jean",    :version => '10.5.110-1'},
                                          {:voice => "Margot",  :version => '10.5.110-1'},
                                          {:voice => "Antonio", :version => '10.5.110-1'},
                                          {:voice => "Martina", :version => '10.5.110-1'},
                                          {:voice => "Luis",    :version => '10.5.110-1'},
                                          {:voice => "Lorena",  :version => '10.5.110-1'},
                                          {:voice => "Molly",   :version => '10.5.110-1'}
                                        ]

default['lumenvox']['license_server']['version'] = '10.5.300-1.el6'

default['lumenvox']['media_server']['version']            = '10.5.300-1.el6'
default['lumenvox']['media_server']['mrcp_server_ip']     = 'default'
default['lumenvox']['media_server']['enable_sre_logging'] = 0
default['lumenvox']['media_server']['sre_ip']             = 'default'
default['lumenvox']['media_server']['sip_port']           = 'default'

default['lumenvox']['client']['license_servers']      = ['127.0.0.1:7569']
default['lumenvox']['client']['sre_servers']          = ['127.0.0.1:5730']
default['lumenvox']['client']['tts_servers']          = ['127.0.0.1:7579']
default['lumenvox']['client']['default_tts_language'] = 'default'
default['lumenvox']['client']['default_tts_gender']   = 'default'
default['lumenvox']['client']['default_tts_voice']    = 'default'
default['lumenvox']['client']['version']              = '10.5.300-1.el6'

default['lumenvox']['client']['authentication_username'] =  nil
default['lumenvox']['client']['authentication_password'] =  nil
