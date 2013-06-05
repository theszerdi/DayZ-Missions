//Firebase mission
private ["_coords","_dummymarker","_base","_wait"];
_wait = [2000,650] call fnc_hTime;
sleep _wait;
[nil,nil,rTitleText,"A firebase has been constructed! Secure it for yourself!", "PLAIN",6] call RE;
[nil,nil,rGlobalRadio,"A firebase has been constructed! Secure it for yourself!"] call RE;
[nil,nil,rHINT,"A firebase has been constructed! Secure it for yourself!"] call RE;

_coords = [getMarkerPos "center",0,12000,50,0,20,0] call BIS_fnc_findSafePos;

_dummymarker = createMarker["STR_MISSION_MARKER_3", _coords];
_dummymarker setMarkerColor "ColorGreen";
_dummymarker setMarkerShape "ELLIPSE";
_dummymarker setMarkerBrush "Grid";
_dummymarker setMarkerSize [150,150];

_base = ["land_fortified_nest_big","Land_Fort_Watchtower"] call BIS_fnc_selectRandom;
baserunover = createVehicle [_base,[(_coords select 0) - 20, (_coords select 1) - 10,-0.2],[], 0, "NONE"];
box = createVehicle ["USLaunchersBox",[(_coords select 0) + 2, (_coords select 1),0],[], 0, "NONE"];
[BOX] execVM "\z\addons\dayz_server\missions\misc\fillLaunchBoxes.sqf";

_aispawn = [_coords,80,6,3,1] execVM "\z\addons\dayz_server\missions\add_unit_server.sqf";//AI Guards
sleep 5;
_aispawn = [_coords,40,4,3,1] execVM "\z\addons\dayz_server\missions\add_unit_server.sqf";//AI Guards

waitUntil{{isPlayer _x && _x distance baserunover < 20  } count playableunits > 0}; 

[nil,nil,rTitleText,"The base is yours. Excellent work, now keep it to yourself or let anyone use it.", "PLAIN",6] call RE;
[nil,nil,rGlobalRadio,"The base is yours. Excellent work, now keep it to yourself or let anyone use it."] call RE;
[nil,nil,rHINT,"The base is yours. Excellent work, now keep it to yourself or let anyone use it."] call RE;

deleteMarker _dummymarker;

SM1 = 1;
[0] execVM "\z\addons\dayz_server\missions\major\SMfinder.sqf";
