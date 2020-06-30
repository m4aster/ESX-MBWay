--[[############################
    #########CRIADO POR#########
    #########𝙼𝚊𝚜𝚝𝚎𝚛#9335#######
    ############################]]

ESX                         = nil
inMenu                      = true
local bankMenu = true

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)

RegisterCommand("mbw", function(data)
  inMenu = true
  SetNuiFocus(true, true)
  SendNUIMessage({type = 'openGeneral'})
  TriggerServerEvent('mb:balance')
  local ped = GetPlayerPed(-1)
end)

RegisterNetEvent('currentbalance1')
AddEventHandler('currentbalance1', function(balance)
	local id = PlayerId()
	local playerName = GetPlayerName(id)
	
	SendNUIMessage({
		type = "balanceHUD",
		balance = balance,
		player = playerName
		})
end)

RegisterNUICallback('deposit', function(data)
	TriggerServerEvent('mb:deposit', tonumber(data.amount))
end)

RegisterNUICallback('withdrawl', function(data)
	TriggerServerEvent('mb:withdraw', tonumber(data.amountw))
end)

RegisterNUICallback('balance', function()
	TriggerServerEvent('mb:balance')
end)

RegisterNetEvent('balance:back')
AddEventHandler('balance:back', function(balance)

	SendNUIMessage({type = 'balanceReturn', bal = balance})

end)

RegisterNUICallback('transfer', function(data)
	TriggerServerEvent('bank:transfer', data.to, data.amountt)
	
end)

RegisterNUICallback('NUIFocusOff', function()
  inMenu = false
  SetNuiFocus(false, false)
  SendNUIMessage({type = 'closeAll'})
end)

function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end