local config = require '@qbx_garages.config.shared'
local VEHICLES = exports.qbx_core:GetVehiclesByName()

lib.callback.register('npwd_qbx_garages:server:getPlayerVehicles', function(source)
	local player = exports.qbx_core:GetPlayer(source)
	local result = MySQL.query.await('SELECT * FROM player_vehicles WHERE citizenid = ?', {player.PlayerData.citizenid})

	if result[1] ~= nil then
		for _, v in pairs(result) do
			local model = v.vehicle

			v.model = model
			v.vehicle = 'Unknown'
			v.brand = 'Vehicle'

			if v.state == 0 then
				v.state = 'out'
			elseif v.state == 1 then
				v.state = 'garaged'
			elseif v.state == 2 then
				v.state = 'impounded'
			else
				v.state = 'unknown'
			end

			if VEHICLES[model] then
				v.vehicle = VEHICLES[model].name
				v.brand = VEHICLES[model].brand
			end

			v.garage = config.garages[v.garage]?.label or 'Unknown Garage'
		end

		return result
	end
end)
