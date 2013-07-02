//Sniper team script Created by TheSzerdi Edited by Falcyn [QF]
private ["_coords","_wait","_dummymarker"];

[] execVM "\z\addons\dayz_server\Missions\SMGoMinor.sqf";
WaitUntil {MissionGoMinor == 1};

_coords = [getMarkerPos "center",0,7000,2,0,2000,0] call BIS_fnc_findSafePos;

[nil,nil,rTitleText,"A sniper team has been spotted!", "PLAIN",6] call RE;
[nil,nil,rGlobalRadio,"A sniper team has been spotted!"] call RE;
[nil,nil,rHINT,"A sniper team has been spotted!"] call RE;


MCoords = _coords;
publicVariable "MCoords";
[] execVM "debug\addmarkers75.sqf";

[_coords,80,4,2,1] execVM "\z\addons\dayz_server\missions\add_unit_server2.sqf";//AI Guards
sleep 1;
waitUntil{({alive _x} count (units SniperTeam)) < 1};

[nil,nil,rTitleText,"You've killed the snipers! Now loot the corpses!", "PLAIN",6] call RE;
[nil,nil,rGlobalRadio,"You've killed the snipers! Now loot the corpses!"] call RE;
[nil,nil,rHINT,"You've killed the snipers! Now loot the corpses!"] call RE;

[] execVM "debug\remmarkers75.sqf";
MissionGoMinor = 0;
MCoords = 0;
publicVariable "MCoords";

SM1 = 1;
[0] execVM "\z\addons\dayz_server\missions\minor\SMfinder.sqf";
