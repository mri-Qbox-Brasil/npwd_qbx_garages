fx_version "cerulean"
game "gta5"

shared_scripts {
    '@ox_lib/init.lua',
    '@qbx_core/modules/utils.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/*.lua',
}

client_scripts {
    'client/*.lua',
}

ui_page 'web/dist/index.html'

files {
    'web/dist/index.html',
    'web/dist/*.js',
}

lua54 'yes'
use_experimental_fxv2_oal 'yes'