
# Atributes


#### Setting passwords for the Lumenvox

You can set passwords via attributes

    node['lumenvox']['client']['authentication_username']  =  foo
    node['lumenvox']['client']['authentication_password']  =  foo

Or you can pass then in via environment prior to running Chef

    export LUMENVOX_USERNAME=foo
    export LUMENVOX_PASSWORD=bar
    chef-solo -c solo.rb -j dna.json -l debug
