ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_getc4:buy')
AddEventHandler('esx_getc4:buy', function()

    local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	local xPlayers = ESX.GetPlayers()
	
	local money = xPlayer.getAccount('money').money
    
	if (money >= 150000) then
		xPlayer.removeAccountMoney('money', 150000)
		xPlayer.addInventoryItem('c4_bank', 1)
		TriggerClientEvent('esx:showNotification', source, '你購買了~r~C4')
    else
		TriggerClientEvent('esx:showNotification', source, '金錢不足~r~!')
    end
end)

RegisterServerEvent('esx_getc4:buy2')
AddEventHandler('esx_getc4:buy2', function()

    local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	local xPlayers = ESX.GetPlayers()
	
	local money = xPlayer.getAccount('money').money
    
	if (money >= 150000) then
		xPlayer.removeAccountMoney('money', 100000)
		xPlayer.addInventoryItem('blowtorch', 1)
		TriggerClientEvent('esx:showNotification', source, '你購買了~r~噴燈')
    else
		TriggerClientEvent('esx:showNotification', source, '金錢不足~r~!')
    end
end)