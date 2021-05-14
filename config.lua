-- Made by ! 1« NoobKeks_TV »#1337 --
-- Support & more of my Work - https://discord.gg/6jsHUVMh8G --

-- Copyright (C) 2021 - EgoPvP.com

--This program Is free software: you can redistribute it And/Or modify it under the terms Of the GNU General Public License As published 
--by the Free Software Foundation, either version 3 Of the License, Or (at your option) any later version.

--This program Is distributed In the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty Of MERCHANTABILITY Or 
--FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License For more details.

--You should have received a copy Of the GNU General Public License along with this program. If Not, see http://www.gnu.org/licenses/.


Config = {}

Config.Locale = 'de' -- Change to your preferred Language (de, en)
Config.JobRestriction = 'false' -- Should the Tow Command & Event be restricted to Players with a specific Job?  true = restricted   | fale = not restricted
Config.NeededJob = 'mechanic' -- Which Jobs should be allowed to Tow a Vehicle via Command/Event  !! ONLY WORKS WHEN "JobRestriction = true" !!
Config.EnableCommand = true -- Enable or disable Towing a Vehicle via command  true = enabled  | false = disabled
Config.VehicleRange = 10.0 -- Which range should be checked for checking for towable vehicles when trying to tow one
Config.MaxVehicleDistance = 12.0 -- How far can a Vehicle be away from the Flatbed to still be loaded onto it (dont make it to high or it wont be anywhere near reality!)
Config.OnlyStoppedEngines = true -- Should the engine of the vehicle you want to tow be running or not when trying to tow it.  true = Only allow stopped Vehicles | false = Allow started & stopped engines
Config.FlatbedDistance = -12.0 -- The Distance, a Vehicle should be teleported behind your Flatbed, when unloading it !! DONT MAKE IT TO LOW OR IT WILL BE STUCK IN YOUR FLATBED !!  !! NEEDS TO BE A NEGATIVE NUMBER !! 

Config.Flatbeds= { -- The Vehicle (spawn-names) of your Flatbed-Vehicles / cars which can load other Vehicles on them.  X, Y, Z - Where should the Vehicle be attached to the Tow-Truck? x = left/right, y = forwards/backwards, z = up/down
    ['flatbed'] = {x = 0.0, y = -0.85, z = 1.25} -- default GTA V flatbed
}

Config.TowBlacklist = { -- Which Vehicles (spawn-names) are not allowed to be towed 
    'mule'
}
