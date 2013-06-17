//Special weapons squad script by TheSzerdi with credit to TAW_Tonic

private ["_coords","_dummymarker","_wait"];
_wait = [2000,650] call fnc_hTime;
sleep _wait;

[nil,nil,rTitleText,"A special weapons squad has arrived! Kill them for their weapons!", "PLAIN",6] call RE;
[nil,nil,rGlobalRadio,"A special weapons squad has arrived! Kill them for their weapons!"] call RE;
[nil,nil,rHINT,"A special weapons squad has arrived! Kill them for their weapons!"] call RE;

_coords = [getMarkerPos "center",0,4000,30,0,2000,0] call BIS_fnc_findSafePos;

_dummymarker = createMarker["STR_MISSION_MARKER_6", _coords];
_dummymarker setMarkerColor "ColorGreen";
_dummymarker setMarkerShape "ELLIPSE";
_dummymarker setMarkerBrush "Grid";
_dummymarker setMarkerSize [150,150];

box = createVehicle ["USVehicleBox",[(_coords select 0) - 3, (_coords select 1) - 3,0],[], 0, "NONE"];
[BOX] execVM "\z\addons\dayz_server\missions\misc\fillBoxes.sqf";

_aispawn = [_coords,80,6,6,1] execVM "\z\addons\dayz_server\missions\add_unit_server.sqf";//AI Guards
sleep 5;
_aispawn = [_coords,40,4,4,1] execVM "\z\addons\dayz_server\missions\add_unit_server.sqf";//AI Guards

waitUntil{{isPlayer _x && _x distance box < 20  } count playableunits > 0}; 

[nil,nil,rTitleText,"The special weapons have been found, nice work, enjoy the spoils.", "PLAIN",6] call RE;
[nil,nil,rGlobalRadio,"The special weapons have been found, nice work, enjoy the spoils."] call RE;
[nil,nil,rHINT,"The special weapons have been found, nice work, enjoy the spoils."] call RE;

deleteMarker _dummymarker;
SM1 = 1;
[0] execVM "\z\addons\dayz_server\missions\major\SMfinder.sqf";
