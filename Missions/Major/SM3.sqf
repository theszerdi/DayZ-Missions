//Firebase mission Created by TheSzerdi Edited by Falcyn [QF]
private ["_coords","_dummymarker","_base","_wait","_coord1","_coord2","_coord3","_coord4","_coord5","_coord6","_coord7","_coord8","_coord9","_coord10","_coord11","_coord12"];
[] execVM "\z\addons\dayz_server\Missions\SMGoMajor.sqf";
WaitUntil {MissionGo == 1};

_coord1 = [4908.355,11216.505,0];
_coord2 = [6162.9888,11324.005,0];
_coord3 = [7761.3657,11569.265,0];
_coord4 = [8336.6055,10441.17,0];
_coord5 = [7201.0664,10400.667,0];
_coord6 = [6249.1104,9579.043,0];
_coord7 = [4763.3818,9802.2734,0];
_coord8 = [3675.6865,7353.2798,0];
_coord9 = [6815.6362,5599.0854,0];
_coord10 = [7532.0742,8164.3203,0];
_coord11 = [6046.6455,8771.2178,0];
_coord12 = [5266.6836,7273.8135,0];

_coords = [_coord1, _coord2, _coord3, _coord4, _coord5, _coord6, _coord7, _coord8, _coord9, _coord10, _coord11, _coord12] call BIS_fnc_selectRandom;

[nil,nil,rTitleText,"A firebase has been constructed! Secure it for yourself!", "PLAIN",6] call RE;
[nil,nil,rGlobalRadio,"A firebase has been constructed! Secure it for yourself!"] call RE;
[nil,nil,rHINT,"A firebase has been constructed! Secure it for yourself!"] call RE;

Ccoords = _coords;
publicVariable "Ccoords";
[] execVM "debug\addmarkers.sqf";

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

[] execVM "debug\remmarkers.sqf";
MissionGo = 0;
Ccoords = 0;
publicVariable "Ccoords";

SM1 = 1;
[0] execVM "\z\addons\dayz_server\missions\major\SMfinder.sqf";
