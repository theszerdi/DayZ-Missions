//APC Mission by TheSzerdi with credit to TAW_Tonic
private ["_coords","_dummymarker","_chopper","_wait"];
_wait = [2000,650] call fnc_hTime;
sleep _wait;
[nil,nil,rTitleText,"An APC has broken down! Secure it's firepower for yourself!", "PLAIN",6] call RE;
[nil,nil,rGlobalRadio,"An APC has broken down! Secure it's firepower for yourself!"] call RE;
[nil,nil,rHINT,"An APC has broken down! Secure it's firepower for yourself!"] call RE;

_coords = [getMarkerPos "center",0,12000,30,0,20,0] call BIS_fnc_findSafePos;

_dummymarker = createMarker["STR_MISSION_MARKER_6", _coords];
_dummymarker setMarkerColor "ColorGreen";
_dummymarker setMarkerShape "ELLIPSE";
_dummymarker setMarkerBrush "Grid";
_dummymarker setMarkerSize [150,150];

_chopper = ["BTR60_TK_EP1","LAV25","LAV25_HQ","LAV25_HQ","LAV25_HQ"] call BIS_fnc_selectRandom;

hueychop = createVehicle [_chopper,_coords,[], 0, "NONE"];
hueychop setVariable ["Mission",1,true];
hueychop setFuel 0;
hueychop setVehicleAmmo 0.5;

_aispawn = [_coords,80,6,4,1] execVM "\z\addons\dayz_server\missions\add_unit_server.sqf";//AI Guards
sleep 5;
_aispawn = [_coords,80,6,4,1] execVM "\z\addons\dayz_server\missions\add_unit_server.sqf";//AI Guards
sleep 5;
_aispawn = [_coords,40,4,4,1] execVM "\z\addons\dayz_server\missions\add_unit_server.sqf";//AI Guards


waitUntil{{isPlayer _x && _x distance hueychop < 20  } count playableunits > 0}; 

deleteMarker _dummymarker;

[nil,nil,rTitleText,"Good work you've secured the APC!", "PLAIN",6] call RE;
[nil,nil,rGlobalRadio,"Good work you've secured the APC!"] call RE;
[nil,nil,rHINT,"Good work you've secured the APC!"] call RE;

SM1 = 5;
[0] execVM "\z\addons\dayz_server\missions\major\SMfinder.sqf";
