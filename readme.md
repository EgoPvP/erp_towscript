# erp_towscript
Highly Customisable and top working Vehicle Towing Script for FiveM

This Script has many many Options for you to Change the behaivour of the Tow-Truck & does work in latest FiveM builds even after all the vehicle entity changes.


### This Script can now be Bought here: [CLICK HERE](https://shop.egorp.net/package/4668418)


## Features

Pretty obvious, attaching vehicles onto your Flatbed :slight_smile: 
 Also:

- Blacklisting vehicles from being towed
- Job restriction (to a Job of your choice)
- Usage via Command/Event (Command can be disabled)
- Multiple Flatbeds with custom positioning for the towed vehicles
- Multi-Language-Support 

## How to Install?
1. Download the latest Release of erp_towscript
2. Copy the Folder into your resources/ folder
3. Add `ensure erp_towscript` to your server.cfg
4. Add your Flatbed Vehicles to the "config.lua" file and change the Offset properly. 
5. Change your prefered Language in the "config.lua" file
6. Change other stuff in the "config.lua" file to your preffered settings
7. Have fun using the Script :) 

## Dependencies

* es_extended - 1.x

## Language Support
 - de - German | Done by me 
 - en - English | Done by me 
 - nl - Dutch | Thanks to [@Jaccosf](https://github.com/Jaccosf)
 - tr - Turkish | Thanks to @Wizley#3099
 - pt - Portuguese | Thanks to [@coentro](https://github.com/coentro)

If you want to help translate this Script, feel free to do a PR :)

## Config explanation
Option | Description
------------- | -------------
Locale | The Language of the messages send by the script
JobRestriction | Whether or not only a certain ESX Job should be allowed to use the Tow-Function 
NeededJob | The Job needed to use the Tow-Function 
EnableCommand | Should the `/tow` Command be enabled?
VehicleRange  | How far away can a Car Stand behind the Flatbed to be recognized
OnlyStoppedEngines | Should Vehicles with a running Engine be allowed to be Towed
FlatbedDistance | The Distance a Vehicle should be teleported to when unloading it from the Flatbed
Flatbeds | The list of your Flatbeds + Its offset to the Vehicles Center position when Attaching Vehicles to it.
TowBlacklist | A List of vehicles not allowed to be Towed (eg. mule, monstertruck, etc.)

## Adding the Event to your Menues 
If you dont want to use the `/tow` or you simply want to add a button into your Job menue to Tow a Vehicle, you can Trigger the Script's own event for that like this:

`TriggerEvent('erp_towscirpt:tow')`

## Does this generate Lag?
Since i got many requests on "Does this Script generate lag / how is its CPU time on resmon" 
i checked it and it was as i expected it: 0,00ms!
![image|690x12](https://forum.cfx.re/uploads/default/original/4X/a/4/2/a425a7a66c017cb456e93db9b2e145e0f9d4bc47.png)

## Other Scripts

We now offer Custom Script creations at our Store: [CLICK ME](https://shop.egorp.net/category/custom-development)

- [SaltyNUI](https://shop.egorp.net/package/4668315) - Discourage Users without Temspeak running when using SaltyChat!

- [erp_saltycircle](https://shop.egorp.net/package/4668429) - A basic Circle, visualizing your current voice range when using Saltychat

- [erp_weaponrange](https://shop.egorp.net/package/5167273) - Have people do some shooting excersise before gaining the Weapons License.

- [erp_towscript](https://shop.egorp.net/package/4668418) - Highly Customisable and top working Vehicle Towing Script for FiveM

- [erp_antifalldown](https://github.com/EgoPvP/erp_antifalldown) - Stop your Player from falling into the dark void.

- [erp_antiwhipping](https://github.com/EgoPvP/erp_antiwhipping) - Stop Players from hitting others when standing close.

- [erp_racing](https://shop.egorp.net/package/4666867) - Battle your Friends in epic 1 vs 1 races across LosSantos!

- [sitdown](https://shop.egorp.net/package/4668426) - Sitting made easy!

## Support
If you need any kind of Support, feel free to open an Issue.

Discord - https://discord.gg/qRc5Hbb


## License

erp_towscript - Highly Customisable and top working Vehicle Towing Script for FiveM

Copyright (C) 2021 - [EgoPvP.com](https://egopvp.com)
