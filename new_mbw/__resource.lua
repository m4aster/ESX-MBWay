--[[############################
    #########CRIADO POR#########
    #########𝙼𝚊𝚜𝚝𝚎𝚛#9335#######
    ############################]]

client_script('client/client.lua') 

server_script {
"@mysql-async/lib/MySQL.lua",
'server.lua'
}

ui_page('client/html/UI.html') 

files {
    'client/html/UI.html',
    'client/html/style.css'
}
