fx_version 'cerulean'
game 'gta5'

author 'hitachi_90'
description 'ESX EMS-Bag for the Medicjob'
version '1.0.2'
lua54 'yes'
this_is_a_map 'yes'

shared_scripts {
    '@ox_lib/init.lua',
    "configs/**.lua"
}

server_script {
    "server/**.lua"
}

client_script {
    "client/**.lua"
}

escrow_ignore {
    "configs/**.lua",
    "README.lua"
}

files {
    'stream/prop_cs_shopping_bag.ydr'
}


