local function findVehFromPlateAndLocate(plate)
	local gameVehicles = GetVehicles()
	for i = 1, #gameVehicles do
		local vehicle = gameVehicles[i]
		if DoesEntityExist(vehicle) then
			if GetPlate(vehicle) == plate then
				local vehCoords = GetEntityCoords(vehicle)
				SetNewWaypoint(vehCoords.x, vehCoords.y)
				return true
			end
		end
	end
end

RegisterNUICallback("npwd:qbx_garage:getVehicles", function(_, cb)
	local vehicles = lib.callback.await('npwd_qbx_garages:server:getPlayerVehicles', false)
	for _, v in pairs(vehicles) do
		local type = GetVehicleClassFromName(v.model)
		if type == 15 or type == 16 then
			v.type = "aircraft"
		elseif type == 14 then
			v.type = "boat"
		elseif type == 13 or type == 8 then
			v.type = "bike"
		else
			v.type = "car"
		end
	end

	cb({ status = "ok", data = vehicles })
end)

RegisterNUICallback("npwd:qbx_garage:requestWaypoint", function(data, cb)
	local plate = data.plate
	if findVehFromPlateAndLocate(plate) then
		exports.qbx_core:Notify("Your vehicle has been marked", "success")
	else
		exports.qbx_core:Notify("This vehicle cannot be located", "error")
	end
	cb({})
end)