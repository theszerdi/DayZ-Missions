//Landing party sidemission by TheSzerdi with credit to TAW_Tonic
private ["_coord1","_coord2","_coord3","_coords","_wait","_dummymarker"];
_wait = [600,300] call fnc_hTime;
sleep _wait;
[nil,nil,rTitleText,"A landing party is establishing a beachhead!", "PLAIN",6] call RE;
[nil,nil,rGlobalRadio,"A landing party is establishing a beachhead!"] call RE;
[nil,nil,rHINT,"A landing party is establishing a beachhead!"] call RE;

//YOU MUST SPECIFY A SPAWN COORD AND A BEACH COORD FOR EACH ARRAY FOR YOUR MAP
_coord1 = [[1203.32,2280.92,0],[1203.32,2280.92,0]];
_coord2 = [[8185.9,2767.72,0],[8185.9,2767.72,0]];
_coord3 = [[13231.3,7369.12,0],[13231.3,7369.12,0]];

_coords = [_coord1, _coord2, _coord3] call BIS_fnc_selectRandom;

_dummymarker = createMarker["Landing Party", _coords select 1];
_dummymarker setMarkerColor "ColorRed";
_dummymarker setMarkerShape "ELLIPSE";
_dummymarker setMarkerBrush "Grid";
_dummymarker setMarkerSize [75,75];

pbxride = createVehicle ["PBX",_coords select 0,[], 0, "NONE"];
pbxride setVariable ["Mission",1,true];
pbxride setFuel 1;

[_coords select 0,4,1] execVM "\z\addons\dayz_server\missions\add_unit_server3.sqf";//AI Guards
sleep 1;
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
tentloot addMagazineCargoGlobal ["Skin_Camo1_DZ", 1];
tentloot addMagazineCargoGlobal ["Skin_Sniper1_DZ", 1];
tentloot addBackpackCargoGlobal ["DZ_Backpack_EP1",2];
tentloot addMagazineCargoGlobal ["ItemJerryCan",2];


waitUntil{{isPlayer _x && _x distance tentloot < 10  } count playableunits > 0}; 

deleteMarker _dummymarker;

[nil,nil,rTitleText,"You've secured the beachhead! Good work.", "PLAIN",6] call RE;
[nil,nil,rGlobalRadio,"You've secured the beachhead! Good work."] call RE;
[nil,nil,rHINT,"You've secured the beachhead! Good work."] call RE;

SM1 = 1;
[0] execVM "\z\addons\dayz_server\missions\minor\SMfinder.sqf";
