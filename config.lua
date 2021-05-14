Config = {}

Config.Locale = 'de' -- Change to your preferred Language (de, en)
Config.YourFramework = 'ESX' -- Which Framework are you using  -> To get the Player's Job (Available: ESX)  (more following soon!)
Config.JobRestriction = 'false' -- Should the Tow Command & Event be restricted to Players with a specific Job?  true = restricted   | fale = not restricted
Config.NeededJob = 'mechanic' -- Which Jobs should be allowed to Tow a Vehicle via Command/Event  !! ONLY WORKS WHEN "JobRestriction = true" !!
Config.EnableCommand = true -- Enable or disable Towing a Vehicle via command  true = enabled  | false = disabled
Config.VehicleRange = 10.0 -- Which range should be checked for checking for towable vehicles when trying to tow one

Config.Flatbeds= { -- The Vehicle (spawn-names) of your Flatbed-Vehicles / cars which can load other Vehicles on them.  X, Y, Z - Where should the Vehicle be attached to the Tow-Truck? x = left/right, y = forwards/backwards, z = up/down
    ['flatbed'] = {x = 0.0, y = -0.85, z = 1.25} -- default GTA V flatbed
}

Config.TowBlacklist = { -- Which Vehicles (spawn-names) are not allowed to be towed 
    'mule'
}
