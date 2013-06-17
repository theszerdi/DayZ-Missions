//Sniper team script by TheSzerdi with credit to TAW_Tonic
private ["_coords","_wait","_dummymarker"];

_wait = [600,300] call fnc_hTime;
sleep _wait;

[nil,nil,rTitleText,"A sniper team has been spotted!", "PLAIN",6] call RE;
[nil,nil,rGlobalRadio,"A sniper team has been spotted!"] call RE;
[nil,nil,rHINT,"A sniper team has been spotted!"] call RE;

_coords = [getMarkerPos "center",0,4000,2,0,2000,0] call BIS_fnc_findSafePos;

_dummymarker = createMarker["Sniper Team", _coords];
_dummymarker setMarkerColor "ColorRed";
_dummymarker setMarkerShape "ELLIPSE";
_dummymarker setMarkerBrush "Grid";
_dummymarker setMarkerSize [75,75];

[_coords,80,4,2,1] execVM "\z\addons\dayz_server\missions\add_unit_server2.sqf";//AI Guards
sleep 1;
waitUntil{({alive _x} count (units SniperTeam)) < 1};

[nil,nil,rTitleText,"You've killed the snipers! Now loot the corpses!", "PLAIN",6] call RE;
[nil,nil,rGlobalRadio,"You've killed the snipers! Now loot the corpses!"] call RE;
[nil,nil,rHINT,"You've killed the snipers! Now loot the corpses!"] call RE;

deleteMarker _dummymarker;
SM1 = 1;
[0] execVM "\z\addons\dayz_server\missions\minor\SMfinder.sqf";
