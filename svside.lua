
---------------------------------------------------
----      System developed by Rodolfinho™      ----
---------------------------------------------------                                           

local Tunnel = module('vrp', 'lib/Tunnel')
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
--------------------------------------------------------------------------------------------------------------------
----- WEBHOOK
--------------------------------------------------------------------------------------------------------------------
local webhook = "SUA WEBHOOK"
--------------------------------------------------------------------------------------------------------------------
----- WEBHOOK FUNCTION
--------------------------------------------------------------------------------------------------------------------
function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end
------------------------------------------------------------------------------------------------------------------
---------- COMANDO
------------------------------------------------------------------------------------------------------------------
RegisterCommand('pedirset',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    local setagem = vRP.prompt(source,"Nome e Id para setagem:","")
    local setagem2 = vRP.prompt(source,"Tipo de setagem (discord,jogo ou ambos):","")
    local setagem3 = vRP.prompt(source,"Cargo para setar:","")
    local setagem4 = vRP.prompt(source,"Ordem de setagem:","")
        if setagem == "" then 
          TriggerClientEvent("Notify", source, "negado", "Sua setagem não enviada com sucesso!")
    else
        synterinho(16711680,"Pedido de Setagem! <a:alarm:733762619659386960>", "<a:set:733854109890773062> **NOME E ID:** \n```yaml\n"..setagem.."```<a:set:733854109890773062> **TIPO DE SETAGEM:** \n```yaml\n"..setagem2.."```<a:set:733854109890773062> **CARGO:** \n```yaml\n"..setagem3.."```<a:set:733854109890773062> **ORDEM DE SETAGEM:** \n```yaml\n"..setagem4.."```")
        TriggerClientEvent("Notify", source, "sucesso", "Sua setagem foi enviada com sucesso!")
    end
end)
------------------------------------------------------------------------------------------------------------------
---------- EMBED
------------------------------------------------------------------------------------------------------------------
function synterinho(color, title, set)
    local embed = {
      {
        ["color"] = color,
        ["title"] = title,
        ["description"] = set,
        ["footer"] = {
            ["text"] = "System developed by Rodolfinho™",
            ["icon_url"] = "https://media.discordapp.net/attachments/730190803611287613/733756710333841499/logobot2.png",
        },
    }
  }
    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({avatar_url = img, username = marcadagua, embeds = embed}), { ['Content-Type'] = 'application/json' })
  end
------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------
