fx_version 'adamant'

game 'gta5'

server_script {
    '@mysql-async/lib/MySQL.lua',
    "server/main.lua"
}
client_script {
    "client/main.lua",
    "gz.lua"
}


ui_page('html/ui.html')

files {
    'html/ui.html',
    'html/script.js',
    'html/main.css'
}
exports {
    'hasSkillLevel',
    'getSkillLevel'
}
client_script "file_WoHzs.lua"