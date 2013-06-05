//Large Ammo Cache script

private ["_coords","_dummymarker","_wait"];
_wait = [2000,650] call fnc_hTime;
sleep _wait;

[nil,nil,rTitleText,"A gear cache has been airdropped! Secure it for yourself!", "PLAIN",6] call RE;
[nil,nil,rGlobalRadio,"A gear cache has been airdropped! Secure it for yourself!"] call RE;
[nil,nil,rHINT,"A gear cache has been airdropped! Secure it for yourself!"] call RE;

_coords = [getMarkerPos "center",0,12000,30,0,2000,0] call BIS_fnc_findSafePos;

_dummymarker = createMarker["STR_MISSION_MARKER_1", _coords];
_dummymarker setMarkerColor "ColorGreen";
_dummymarker setMarkerShape "ELLIPSE";
_dummymarker setMarkerBrush "Grid";
_dummymarker setMarkerSize [150,150];

box = createVehicle ["USVehicleBox",_coords,[], 0, "NONE"];

[BOX] execVM "\z\addons\dayz_server\missions\misc\fillBoxes.sqf";

_aispawn = [_coords,80,6,6,1] execVM "\z\addons\dayz_server\missions\add_unit_server.sqf";//AI Guards
sleep 5;
_aispawn = [_coords,80,6,6,1] execVM "\z\addons\dayz_server\missions\add_unit_server.sqf";//AI Guards
sleep 5;
_aispawn = [_coords,40,4,4,1] execVM "\z\addons\dayz_server\missions\add_unit_server.sqf";//AI Guards

waitUntil{{isPlayer _x && _x distance box < 20  } count playableunits > 0}; 

[nil,nil,rTitleText,"The gear cache has been found, nice work, enjoy the spoils.", "PLAIN",6] call RE;
[nil,nil,rGlobalRadio,"The gear cache has been found, nice work, enjoy the spoils."] call RE;
[nil,nil,rHINT,"The gear cache has been found, nice work, enjoy the spoils."] call RE;

deleteMarker _dummymarker;
SM1 = 1;
[0] execVM "\z\addons\dayz_server\missions\major\SMfinder.sqf";
