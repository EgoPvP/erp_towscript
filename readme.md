# erp_towscript
Highly Customisable and top working Vehicle Towing Script for FiveM

This Script has many many Options for you to Change the behaivour of the Tow-Truck & does work in latest FiveM builds even after all the vehicle entity changes.


** UPDATE AVAILABLE - NOW WORKING FOR SHURE! ** 

Sorry guys, accidentally uploaded my test version isntead the one which was supposed to go live.
Thanks to [@0pax](https://github.com/0pax) for pointing this out!


## How to Install?
- Download the latest Release of erp_towscript
- Copy the Folder into your ressources/ folder
- Add `ensure erp_towscript` to your server.cfg
- Add your Flatbed Vehicles to the "config.lua" file and change the Offset properly. 
- Change your prefered Language in the "config.lua" file
- Change other stuff in the "config.lua" file to your preffered settings
- Have fun using the Script :) 

## Dependencies

* es_extended - 1.x

## Language Support
 - de - German | Done by me 
 - en - Englisch | Done by me 
 - nl - Dutch | Thanks to [@Jaccosf](https://github.com/Jaccosf)
 - tr - Turkish | Thanks to @Wizley#3099

If you want to help translate this Script, feel free to do a PR :)

## Config explanation
Option | Description
------------- | -------------
Locale | The Language of the messages send by the script
JobRestriction | Whether or not only a certain ESX Job should be allowed to use the Tow-Function 
NeededJob | The Job needed to use the Tow-Function 
EnableCommand | Should the `/tow` Comand be enabled?
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

## Support
If you need any kind of Support, feel free to open an Issue.

Discord - https://discord.gg/6jsHUVMh8G

## Donate
If you like my work, you can Support me by donating to me

BTC - bc1qn5d5hvecydfcr7xd65z2nun7a8t6wvgc9yuuxr <br>
WBTC - 0x411BFd32d22F2D04A40C2edFE8f5fb8E9Dc80412 <br>
ETH - 0x411BFd32d22F2D04A40C2edFE8f5fb8E9Dc80412 <br>
ZEC - t1XyjYpkBZpvTSD41toPWdzmr2UTq3KKHRT <br>
DASH - Xs9YwqZbyaNHWJcDF1Tgn1jQJqd8XHzLyh <br>
LTC - LMsnx3kVYAtKXJoERq51PZ367wihVmjxns <br>

## License

erp_antifalldown - Stop your Player from falling below the map into the **dark** void.

Copyright (C) 2021 - [EgoPvP.com](https://egopvp.com)

This program Is free software: you can redistribute it And/Or modify it under the terms Of the GNU General Public License As published by the Free Software Foundation, either version 3 Of the License, Or (at your option) any later version.

This program Is distributed In the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty Of MERCHANTABILITY Or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License For more details.

You should have received a copy Of the GNU General Public License along with this program. If Not, see http://www.gnu.org/licenses/.
