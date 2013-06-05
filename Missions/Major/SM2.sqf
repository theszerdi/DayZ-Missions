//Aircraft crash sidemission by TheSzerdi with credit to TAW_Tonic
private ["_coords","_dummymarker","_wait"];
_wait = [2000,650] call fnc_hTime;
sleep _wait;
[nil,nil,rTitleText,"A C-130 has crash landed! Secure it's cargo for yourself!", "PLAIN",6] call RE;
[nil,nil,rGlobalRadio,"A C-130 has crash landed! Secure it's cargo for yourself!"] call RE;
[nil,nil,rHINT,"A C-130 has crash landed! Secure it's cargo for yourself!"] call RE;

_coords = [getMarkerPos "center",0,12000,100,0,20,0] call BIS_fnc_findSafePos;

_dummymarker = createMarker["STR_MISSION_MARKER_2", _coords];
_dummymarker setMarkerColor "ColorGreen";
_dummymarker setMarkerShape "ELLIPSE";
_dummymarker setMarkerBrush "Grid";
_dummymarker setMarkerSize [150,150];

c130wreck = createVehicle ["C130J_wreck_EP1",[(_coords select 0) + 30, (_coords select 1) - 5,0],[], 0, "NONE"];
box = createVehicle ["USVehicleBox",[(_coords select 0) - 10, _coords select 1,0],[], 0, "NONE"];
box2 = createVehicle ["USVehicleBox",[(_coords select 0) - 10, (_coords select 1) - 10,0],[], 0, "NONE"];

[BOX] execVM "\z\addons\dayz_server\missions\misc\fillBoxes.sqf";
[BOX2] execVM "\z\addons\dayz_server\missions\misc\fillBoxes.sqf";


_aispawn = [[(_coords select 0) + 2, _coords select 1,0],80,6,6,1] execVM "\z\addons\dayz_server\missions\add_unit_server.sqf";//AI Guards
sleep 5;
_aispawn = [[(_coords select 0) + 2, _coords select 1,0],80,6,6,1] execVM "\z\addons\dayz_server\missions\add_unit_server.sqf";//AI Guards
sleep 5;
_aispawn = [[(_coords select 0) + 2, _coords select 1,0],40,4,4,1] execVM "\z\addons\dayz_server\missions\add_unit_server.sqf";//AI Guards
sleep 5;
_aispawn = [[(_coords select 0) + 2, _coords select 1,0],40,4,4,1] execVM "\z\addons\dayz_server\missions\add_unit_server.sqf";//AI Guards



waitUntil{{isPlayer _x && _x distance c130wreck < 60  } count playableunits > 0}; 

deleteMarker _dummymarker;

[nil,nil,rTitleText,"You've secured the crash site! Good work.", "PLAIN",6] call RE;
[nil,nil,rGlobalRadio,"You've secured the crash site! Good work."] call RE;
[nil,nil,rHINT,"You've secured the crash site! Good work."] call RE;

SM1 = 1;
[0] execVM "\z\addons\dayz_server\missions\major\SMfinder.sqf";
