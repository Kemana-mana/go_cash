fx_version "cerulean"
game "gta5"

description "go Cash"

author 'go'

version '1.0'

lua54 'yes'


shared_scripts {
    '@ox_lib/init.lua',
    'config.lua'
}

client_scripts {
	'frame.lua',
    'client.lua',
}
server_scripts {
    '@mysql-async/lib/MySQL.lua',
	'@oxmysql/lib/MySQL.lua',
	'frame.lua',
    'server.lua',
}