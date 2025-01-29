fx_version 'cerulean'
game 'gta5'

author 'hitachi_90 - rewrite by mir_mikeeee'
description 'ESX EMS-Bag for ox_inventory/qs-inventory and osp_ambulance'
version '2.0.3'
lua54 'yes'

shared_scripts {
    '@ox_lib/init.lua',
    "configs/*.lua"
}

server_script {
    "server/*.lua"
}

client_script {
    "client/*.lua"
}

escrow_ignore {
    "configs/*.lua",
    "README.lua"
}

files {
    'locales/*.json',
    'stream/**/*.ytyp',
    'stream/**/*.ydr'
}

data_file 'DLC_ITYP_REQUEST' 'stream/**/*.ytyp'