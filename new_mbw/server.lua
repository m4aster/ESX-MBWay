--[[############################
    #########CRIADO POR#########
    #########𝙼𝚊𝚜𝚝𝚎𝚛#9335#######
    ############################]]

ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('mb:deposit')
AddEventHandler('mb:deposit', function(amount)
	local _source = source
	
	local xPlayer = ESX.GetPlayerFromId(_source)
	if amount == nil or amount <= 0 or amount > xPlayer.getMoney() then
		TriggerClientEvent('esx:showAdvancedNotification', _source, 'Banco', 'Depositaste dinheiro', 'Quantidade Invalia', 'CHAR_ANTONIA', 9)
	else
		xPlayer.removeMoney(amount)
		xPlayer.addAccountMoney('bank', tonumber(amount))
		TriggerClientEvent('esx:showAdvancedNotification', _source, 'Banco', 'Depositaste dinheiro', 'Depositado ~g~' .. amount .. '€~s~', 'CHAR_ANTONIA', 9)
	end
end)


RegisterServerEvent('mb:withdraw')
AddEventHandler('mb:withdraw', function(amount)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local base = 0
	amount = tonumber(amount)
	base = xPlayer.getAccount('bank').money
	if amount == nil or amount <= 0 or amount > base then
		TriggerClientEvent('esx:showAdvancedNotification', _source, 'Banco', 'Retiraste dinheiro', 'Quantidade Invalia', 'CHAR_ANTONIA', 9)
	else
		xPlayer.removeAccountMoney('bank', amount)
		xPlayer.addMoney(amount)
                TriggerClientEvent('esx:showAdvancedNotification', _source, 'Banco', 'Retiraste dinheiro', 'Retirado ~r~' .. amount .. '€~s~', 'CHAR_ANTONIA', 9)
	end
end)

RegisterServerEvent('mb:balance')
AddEventHandler('mb:balance', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	balance = xPlayer.getAccount('bank').money
	TriggerClientEvent('currentbalance1', _source, balance)
	
end)


RegisterServerEvent('mb:transfer')
AddEventHandler('mb:transfer', function(to, amountt)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local zPlayer = ESX.GetPlayerFromId(to)
	local balance = 0
	balance = xPlayer.getAccount('bank').money
	zbalance = zPlayer.getAccount('bank').money
	
	if tonumber(_source) == tonumber(to) then
		TriggerClientEvent('esx:showAdvancedNotification', _source, 'Banco', 'Transferiste dinheiro', 'Não podes transferir para ti mesmo!', 'CHAR_ANTONIA', 9)
	else
		if balance <= 0 or balance < tonumber(amountt) or tonumber(amountt) <= 0 then
			TriggerClientEvent('esx:showAdvancedNotification', _source, 'Banco', 'Transferiste dinheiro', 'Dinheiro insuficiente!', 'CHAR_ANTONIA', 9)
		else
			xPlayer.removeAccountMoney('bank', amountt)
			zPlayer.addAccountMoney('bank', amountt)
                        TriggerClientEvent('esx:showAdvancedNotification', _source, 'Banco', 'Transferiste dinheiro', 'Transferiste ~r~' .. amountt .. '€~s~ para ~r~' .. to .. ' .', 'CHAR_ANTONIA', 9)
			TriggerClientEvent('esx:showAdvancedNotification', to, 'Banco', 'Transferiste dinheiro', 'Recebeste ~r~' .. amountt .. '€~s~ de ~r~' .. _source .. ' .', 'CHAR_ANTONIA', 9)
		end
		
	end
end)





