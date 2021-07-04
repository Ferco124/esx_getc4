buy = '按E打開購買選單'
x = 1568.17
y = 3685.29
z = 33.44

ESX = nil TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)  --Get ESX

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
			DrawMarker(1, 1568.17, 3685.29, 33.44, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.45, 1.45, 1.75, 0, 204, 0, 100, false, true, 2, false, false, false, false)
	end
end)

function alert(msg)  --Alert Message Box
    SetTextComponentFormat("STRING")
    AddTextComponentString(msg)
    DisplayHelpTextFromStringLabel(0,0,1,-1)
end
		
Citizen.CreateThread(function() 
	while true do
		Citizen.Wait(0)
		
		local coords = GetEntityCoords(GetPlayerPed(-1))
		
		if(GetDistanceBetweenCoords(coords, x, y, z, true) < 1.75) then
			alert(buy)

			if IsControlJustReleased(1, 38) then
				ESX.UI.Menu.Open( 'default', GetCurrentResourceName(), 'menuname', 
 				 {
  				    title    = ('購買選單'),
  				    align = 'top-left', 
  				    elements = { 
   					{label = ('購買C4 ($150000)?'),     value = 'buy'},
					{label = ('購買噴燈 ($100000)?'),     value = 'buy2'}, 
    				}
 				 },
 				function(data, menu) 
    				if data.current.value == 'buy' then
						TriggerServerEvent('esx_getc4:buy');
						menu.close()				     
					else
						TriggerServerEvent('esx_getc4:buy2');
						menu.close()				  
 		   			 end   
  		   		end,
  				function(data, menu) 
     			 menu.close() 
 			 	end
				)
			end
		end
	end
end)

