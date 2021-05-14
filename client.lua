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

local xoffset = 0.0
local yoffset = 0.0
local zoffset = 0.0

local playerped = PlayerPedId()

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj)
            ESX = obj
        end)
        Citizen.Wait(10)
        PlayerData = ESX.GetPlayerData()
    end
    calculateAccess()
end)

--[[
RegisterNetEvent('esx:')
AddEventHandler('vsFmuCOgE', function(job)
  PlayerData.job = job
  calculateAccess()
end)
]]

function calculateAccess()
    if Config.JobRestriction then
        if PlayerData.job.name:toLower() == Config.NeededJob:toLower() then
            isAllowedToTow = true
        else
            isAllowedToTow = false
        end
    end
end

if Config.EnableCommand then
    RegisterCommand("tow", function()
        TriggerEvent("erp_towscirpt:tow")
    end, false)
end

RegisterNetEvent('erp_towscirpt:tow')
AddEventHandler('erp_towscirpt:tow', function()

    if isAllowedToTow then

        local vehicle = GetLastDrivenVehicle()

        local isVehicleTow = isThisAFlatbed(vehicle)

        if isVehicleTow then

            local coordA = GetEntityCoords(playerped, 1)
            local coordB = GetOffsetFromEntityInWorldCoords(playerped, 0.0, Config.VehicleRange, 0.0)
            local targetVehicle = getVehicleInDirection(coordA, coordB)

            if targetVehicle ~= 0 and targetVehicle ~= nil then
                if not isThisVehicleBlacklisted(targetVehicle) then
                    if not IsEntityUpsidedown(targetVehicle) then 
                           

                    else 
ESX.ShowNotification(_U('vehicle_flipped'))
                    end
                else
                    ESX.ShowNotification(_U('vehicle_blacklisted'))
                end
            else
                ESX.ShowNotification(_U('no_vehicle_found'))
            end

            if currentlyTowedVehicle == nil then

                local targetVehicleLocation = GetEntityCoords(targetVehicle, true)
                local towTruckVehicleLocation = GetEntityCoords(vehicle, true)
                local distanceBetweenVehicles = GetDistanceBetweenCoords(targetVehicleLocation, towTruckVehicleLocation,
                                                    false)
                -- print(tostring(distanceBetweenVehicles)) -- debug only
                -- Distance allowed (in meters) between tow truck and the vehicle to be towed			
                if distanceBetweenVehicles > 12.0 then
                    ShowNotification("So lange Arme habe ich nun auch wieder nicht...")
                else
                    local targetModelHash = GetEntityModel(targetVehicle)
                    -- Check to make sure the target vehicle is allowed to be towed (see settings at lines 8-12)
                    if not ((not allowTowingBoats and IsThisModelABoat(targetModelHash)) or
                        (not allowTowingHelicopters and IsThisModelAHeli(targetModelHash)) or
                        (not allowTowingPlanes and IsThisModelAPlane(targetModelHash)) or
                        (not allowTowingTrains and IsThisModelATrain(targetModelHash)) or
                        (not allowTowingTrailers and isTargetVehicleATrailer(targetModelHash))) then
                        if not IsPedInAnyVehicle(playerped, true) then
                            --  local networkId = NetworkGetNetworkIdFromEntity(targetVehicle)
                            --  SetNetworkIdCanMigrate(networkId, true)
                            if vehicle ~= targetVehicle and IsVehicleStopped(vehicle) then
                                -- TriggerEvent('chatMessage', '', {255,255,255}, xoff .. ' ' .. yoff .. ' ' .. zoff) -- debug line
                                NetworkRequestControlOfEntity(targetVehicle)
                                while not NetworkHasControlOfEntity(targetVehicle) do
                                    Citizen.Wait(5)
                                end
                                NetworkRequestControlOfEntity(vehicle)
                                while not NetworkHasControlOfEntity(vehicle) do
                                    Citizen.Wait(5)
                                end
                                AttachEntityToEntity(targetVehicle, vehicle,
                                    GetEntityBoneIndexByName(vehicle, 'bodyshell'), 0.0 + xoff, -1.5 + yoff, 0.0 + zoff,
                                    0, 0, 0, 1, 1, 0, 1, 0, 1)
                                currentlyTowedVehicle = NetworkGetNetworkIdFromEntity(targetVehicle)
                                ShowNotification("Fahrzeug aufgeladen")

                            else
                                ShowNotification("Soll ich Luft abladen oder?")
                            end
                        else
                            ShowNotification(
                                "Ok, So extrem lange habe habe ich nicht, um bis nach hinten greifen zu können...")
                        end
                    else
                        ShowNotification(
                            "Hol mal 200 Mann her, dann heben wir das Auto darauf, oder wie stell ich mir das gerade vor ohne Seilwinde?")
                    end
                end

            else

                local curVEH = NetworkGetEntityFromNetworkId(currentlyTowedVehicle)
                Citizen.Wait(600)

                NetworkRequestControlOfEntity(curVEH)
                while not NetworkHasControlOfEntity(curVEH) do
                    Citizen.Wait(1)
                end

                DetachEntity(curVEH)

                local vehiclesCoords = GetOffsetFromEntityInWorldCoords(vehicle, 0.0, -12.0, 0.0)
                SetEntityCoords(curVEH, vehiclesCoords["x"], vehiclesCoords["y"], vehiclesCoords["z"], 1, 0, 0, 1)
                SetVehicleOnGroundProperly(curVEH)
                curVEH = nil
                currentlyTowedVehicle = nil
                ShowNotification("Fahrzeug abgeladen")

                --  
            end
        else
            ESX.ShowNotification(_U('not_a_towtruck'))

        end
    else
        ESX.ShowNotification(_U('no_permissions'))
    end
end)

function getVehicleInDirection(coordFrom, coordTo)
    CreateThread(function()
        local rayHandle = CastRayPointToPoint(coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z,
                              10, PlayerPedId(), 0)
        local a, b, c, d, vehicle = GetRaycastResult(rayHandle)
        return vehicle
    end)
end

function isThisAFlatbed(vehicle)
    local isValid = false
    for model, posOffset in pairs(Config.Flatbeds) do
        if GetHashKey(model) == GetHashKey(vehicle) then
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
