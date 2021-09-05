-- Made by ! 1« NoobKeks_TV »#1337 --
-- Support & more of my Work - https://discord.gg/6jsHUVMh8G --
-- Copyright (C) 2021 - EgoPvP.com
-- This program Is free software: you can redistribute it And/Or modify it under the terms Of the GNU General Public License As published 
-- by the Free Software Foundation, either version 3 Of the License, Or (at your option) any later version.
-- This program Is distributed In the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty Of MERCHANTABILITY Or 
-- FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License For more details.
-- You should have received a copy Of the GNU General Public License along with this program. If Not, see http://www.gnu.org/licenses/.
ESX = nil
local PlayerData = {}

local isAllowedToTow = true
local vehicleOnTowTruck = 0

local xoffset = 0.0
local yoffset = 0.0
local zoffset = 0.0

local playerped
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj)
            ESX = obj
                   
        end)
        Citizen.Wait(1)
    end
    PlayerData = ESX.GetPlayerData()
        
    if Config.EnableCommand then
        RegisterCommand("tow", function()
            TriggerEvent("erp_towscirpt:tow")
        end, false)
    end
        
    playerped = PlayerPedId()
    calculateAccess()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    PlayerData.job = job
    calculateAccess()
end)

function calculateAccess()
    if Config.JobRestriction then
        if PlayerData.job.name:lower() == Config.NeededJob:lower() then
            isAllowedToTow = true
        else
            isAllowedToTow = false
        end
    else 
        isAllowedToTow = true
    end
end



RegisterNetEvent('erp_towscirpt:tow')
AddEventHandler('erp_towscirpt:tow', function()

    if isAllowedToTow then

        local vehicle = GetLastDrivenVehicle()

        
        if isThisAFlatbed(vehicle) then

            local coordA = GetEntityCoords(playerped, 1)
            local coordB = GetOffsetFromEntityInWorldCoords(playerped, 0.0, Config.VehicleRange, 0.0)
            local targetVehicle = getVehicleInDirection(coordA, coordB)
            
            Wait(100)

            if vehicleOnTowTruck == 0 or vehicleOnTowTruck == nil then
                
                    if targetVehicle ~= 0 and targetVehicle ~= nil then
                        if vehicle ~= targetVehicle then
                            if not isThisVehicleBlacklisted(targetVehicle) then
                                if not IsEntityUpsidedown(targetVehicle) then
                                    if GetPedInVehicleSeat(targetVehicle, -1) == 0 and
                                        GetPedInVehicleSeat(targetVehicle, 0) == 0 and
                                        GetPedInVehicleSeat(targetVehicle, 1) == 0 and
                                        GetPedInVehicleSeat(targetVehicle, 2) == 0 then
                                        local distanceBetweenVehicles =
                                            GetDistanceBetweenCoords(GetEntityCoords(targetVehicle),
                                                GetEntityCoords(vehicle), false)

                                        if distanceBetweenVehicles <= Config.VehicleRange then
                                            if Config.OnlyStoppedEngines and IsVehicleStopped(targetVehicle) then

                                                NetworkRequestControlOfEntity(targetVehicle)
                                                while not NetworkHasControlOfEntity(targetVehicle) do
                                                    Citizen.Wait(5)
                                                end
                                                NetworkRequestControlOfEntity(vehicle)
                                                while not NetworkHasControlOfEntity(vehicle) do
                                                    Citizen.Wait(5)
                                                end

                                                AttachEntityToEntity(targetVehicle, vehicle,
                                                    GetEntityBoneIndexByName(vehicle, 'bodyshell'), xoffset, yoffset,
                                                    zoffset, 0, 0, 0, 1, 1, 0, 1, 0, 1)
                                                    vehicleOnTowTruck = NetworkGetNetworkIdFromEntity(targetVehicle)

                                                ESX.ShowNotification(_U('vehicle_attached'))

                                            elseif Config.OnlyStoppedEngines and not IsVehicleStopped(targetVehicle) then
                                                ESX.ShowNotification(_U('engine_not_stopped'))
                                            else
                                                NetworkRequestControlOfEntity(targetVehicle)
                                                while not NetworkHasControlOfEntity(targetVehicle) do
                                                    Citizen.Wait(5)
                                                end
                                                NetworkRequestControlOfEntity(vehicle)
                                                while not NetworkHasControlOfEntity(vehicle) do
                                                    Citizen.Wait(5)
                                                end

                                                AttachEntityToEntity(targetVehicle, vehicle,
                                                    GetEntityBoneIndexByName(vehicle, 'bodyshell'), xoffset, yoffset,
                                                    zoffset, 0, 0, 0, 1, 1, 1, 0, 0, 1)
                                                    vehicleOnTowTruck = NetworkGetNetworkIdFromEntity(targetVehicle)
                                                ESX.ShowNotification(_U('vehicle_attached'))
                                            end
                                        else
                                            ESX.ShowNotification(_U('vehicle_to_far_away'))
                                        end
                                    else
                                        ESX.ShowNotification(_U('vehicle_not_empty'))
                                    end
                                else
                                    ESX.ShowNotification(_U('vehicle_flipped'))
                                end
                            else
                                ESX.ShowNotification(_U('vehicle_blacklisted'))
                            end
                        else
                            ESX.ShowNotification(_U('cant_tow_yourself'))
                        end
                    else
                        ESX.ShowNotification(_U('no_vehicle_found'))
                    end
               
            else

                if GetVehiclePedIsIn(PlayerPedId(), false) then 
                if isThisAFlatbed(GetVehiclePedIsIn(PlayerPedId(), false)) then 
                vehicleOnTowTruck = NetworkGetEntityFromNetworkId(vehicleOnTowTruck)

                NetworkRequestControlOfEntity(vehicle)
                while not NetworkHasControlOfEntity(vehicle) do
                    Citizen.Wait(5)
                end
                NetworkRequestControlOfEntity(vehicleOnTowTruck)
                while not NetworkHasControlOfEntity(vehicleOnTowTruck) do
                    Citizen.Wait(5)
                end

                DetachEntity(vehicleOnTowTruck)

                local newVehiclesCoords = GetOffsetFromEntityInWorldCoords(vehicle, 0.0, Config.FlatbedDistance, 0.0)
                SetEntityCoords(vehicleOnTowTruck, newVehiclesCoords["x"], newVehiclesCoords["y"], newVehiclesCoords["z"], 1, 0,
                    0, 1)
                SetVehicleOnGroundProperly(vehicleOnTowTruck)

                ESX.ShowNotification(_U('vehicle_detached'))

                vehicleOnTowTruck = 0
            else 
                ESX.ShowNotification(_U('not_a_towtruck'))
            end
        else 
            ESX.ShowNotification(_U('not_a_towtruck'))
        end
            end

        else
            ESX.ShowNotification(_U('not_a_towtruck'))

        end
    else
        ESX.ShowNotification(_U('no_permissions'))
    end
end)

function getVehicleInDirection(coordFrom, coordTo)
    
        local rayHandle = CastRayPointToPoint(coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z,10, PlayerPedId(), 0)
        local a, b, c, d, vehicle = GetRaycastResult(rayHandle)
        return vehicle
    
end

function isThisAFlatbed(vehicle)
    local isValid = false
    for model, posOffset in pairs(Config.Flatbeds) do
       
        if IsVehicleModel(vehicle, model) then
            
            xoffset = posOffset.x
            yoffset = posOffset.y
            zoffset = posOffset.z
            isValid = true
            break
        end
    end
    return isValid
end

function isThisVehicleBlacklisted(vehicle)
    local isBlacklisted = false
    for model in pairs(Config.TowBlacklist) do
        if GetHashKey(model) == GetHashKey(vehicle) then
            isBlacklisted = true
            break
        end
    end
    return isBlacklisted
end
