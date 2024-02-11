fx_version "cerulean"
game "gta5"

client_script 'client/client.lua'

shared_scripts {
    '@ox_lib/init.lua',
    '@qbx_core/modules/lib.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/server.lua',
}

ui_page 'web/dist/index.html'

files {
    'web/dist/index.html',
    'web/dist/**/*',
}

lua54 'yes'
use_experimental_fxv2_oal 'yes'