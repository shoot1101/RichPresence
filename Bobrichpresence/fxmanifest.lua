fx_version 'cerulean'
game 'gta5'

author 'Bob & Co'
description 'RichPresence'
version '1.0.0'

lua54 'yes'

shared_script 'config/shared.config.lua'

server_script 'source/server/main.server.lua'

client_script 'source/client/main.client.lua'

dependencies {
    '/server:4664',
    '/onesync'
}
