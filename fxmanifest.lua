fx_version 'cerulean'
game 'gta5'

author 'hitachi_90 - rewrite by mir_mikeeee'
description 'EMS-Bag for ox_inventory/qs-inventory/qb-inventory and osp_ambulance'
version '3.1.0'
lua54 'yes'

shared_scripts {
    '@ox_lib/init.lua',
    'shared.lua',
    "configs/*.lua"
}

server_scripts {
    "server/*.lua"
}

client_scripts {
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