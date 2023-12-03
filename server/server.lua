local config = require '@qbx_garages.config.shared'

RegisterNetEvent("npwd:qbx_garage:getVehicles", function()
	local src = source
	local player = exports.qbx_core:GetPlayer(src)
	local garageresult = MySQL.query.await('SELECT * FROM player_vehicles WHERE citizenid = ?', {player.PlayerData.citizenid})

	if garageresult[1] ~= nil then
		for _, v in pairs(garageresult) do
			local vehicleModel = v.vehicle
			v.model = vehicleModel
			v.vehicle = 'Unknown'
			v.brand = 'Vehicle'

			if v.state == 0 then
				v.state = "out"
			elseif v.state == 1 then
				v.state = "garaged"
			elseif v.state == 2 then
				v.state = "impounded"
				-- elseif v.state == 3 then -- add new state for seized vehicles
				-- 	v.state = "seized"
			else
				v.state = "unknown"
			end

			if exports.qbx_core:GetVehiclesByName()[vehicleModel] then
				v.vehicle = exports.qbx_core:GetVehiclesByName()[vehicleModel].name
				v.brand = exports.qbx_core:GetVehiclesByName()[vehicleModel].brand
			end

			if (config.garages[v.garage] ~= nil) then
				v.garage = config.garages[v.garage].label
			else
				v.garage = "Unknown Garage"
			end
		end

		TriggerClientEvent('npwd:qbx_garage:sendVehicles', src, garageresult)
	end
end)