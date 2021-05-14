Config = {}

Config.Locale = 'de' -- Change to your preferred Language (de, en)
Config.JobRestriction = 'false' -- Should the Tow Command & Event be restricted to Players with a specific Job?  true = restricted   | fale = not restricted
Config.NeededJob = 'mechanic' -- Which Jobs should be allowed to Tow a Vehicle via Command/Event  !! ONLY WORKS WHEN "JobRestriction = true" !!
Config.EnableCommand = true -- Enable or disable Towing a Vehicle via command  true = enabled  | false = disabled


Config.Flatbeds= { -- The Vehicle (spawn-names) of your Flatbed-Vehicles / cars which can load other Vehicles on them
    'flatbed',
    'towcar'
}

Config.TowBlacklist = { -- Which Vehicles (spawn-names) are not allowed to be towed 
    'mule'
}
