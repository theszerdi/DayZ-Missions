//Landing party sidemission Created by TheSzerdi Edited by Falcyn [QF]
private ["_coord1","_coord2","_coord3","_coords","_wait","_dummymarker"];
[] execVM "\z\addons\dayz_server\Missions\SMGoMinor.sqf";
WaitUntil {MissionGoMinor == 1};
[nil,nil,rTitleText,"A landing party is establishing a beachhead!", "PLAIN",6] call RE;
[nil,nil,rGlobalRadio,"A landing party is establishing a beachhead!"] call RE;
[nil,nil,rHINT,"A landing party is establishing a beachhead!"] call RE;

//YOU MUST SPECIFY A SPAWN COORD AND A BEACH COORD FOR EACH ARRAY FOR YOUR MAP
_coord1 = [[5277.4878,4246.8672,0],[5270.9004,5645.5161,0]];
_coord2 = [[2040.6782,9746.2754,0],[3415.792,8712.3867,0]];
_coord3 = [[10440.379,8823.4355,0],[8126.8584,8815.1523,0]];

_coords = [_coord1, _coord2, _coord3] call BIS_fnc_selectRandom;

MCoords = _coords select 1;
publicVariable "MCoords";
[] execVM "debug\addmarkers75.sqf";

pbxride = createVehicle ["PBX",_coords select 0,[], 0, "NONE"];
pbxride setVariable ["Mission",1,true];
pbxride setFuel 1;

[_coords select 0,4,1] execVM "\z\addons\dayz_server\missions\add_unit_server3.sqf";//AI Guards
sleep 3;
LandingParty addVehicle pbxride;
LandingParty move (_coords select 1);
waitUntil{(pbxride distance (_coords select 1)) < 50}; 
tentloot = createVehicle ["TentStorage",_coords select 1,[], 0, "NONE"];
tentloot setVariable ["Mission",1,true];
sleep 1;
tentloot addWeaponCargoGlobal ["Binocular_Vector", 1];
tentloot addWeaponCargoGlobal ["ItemCompass", 1];
tentloot addWeaponCargoGlobal ["ItemGPS", 1];
tentloot addWeaponCargoGlobal ["ItemWatch", 1];
tentloot addMagazineCargoGlobal ["FoodCanBakedBeans", 4];
tentloot addMagazineCargoGlobal ["ItemBandage", 4];
tentloot addMagazineCargoGlobal ["ItemMorphine", 2];
tentloot addMagazineCargoGlobal ["ItemPainkiller", 2];
tentloot addMagazineCargoGlobal ["ItemWaterbottle", 4];
tentloot addWeaponCargoGlobal ["ItemKnife", 2];
tentloot addWeaponCargoGlobal ["ItemToolbox", 2];
tentloot addWeaponCargoGlobal ["ItemMatches", 2];
tentloot addMagazineCargoGlobal ["ItemBloodbag", 1];
tentloot addMagazineCargoGlobal ["Skin_CamoWinter_DZN", 1];
tentloot addMagazineCargoGlobal ["Skin_Sniper1_DZ", 1];
tentloot addBackpackCargoGlobal ["BAF_AssaultPack_DZN",2];
tentloot addMagazineCargoGlobal ["ItemJerryCan",2];


waitUntil{{isPlayer _x && _x distance tentloot < 10  } count playableunits > 0}; 

[] execVM "debug\remmarkers75.sqf";
MissionGoMinor = 0;
MCoords = 0;
publicVariable "MCoords";

[nil,nil,rTitleText,"You've secured the beachhead! Good work.", "PLAIN",6] call RE;
[nil,nil,rGlobalRadio,"You've secured the beachhead! Good work."] call RE;
[nil,nil,rHINT,"You've secured the beachhead! Good work."] call RE;

SM1 = 1;
[0] execVM "\z\addons\dayz_server\missions\minor\SMfinder.sqf";
