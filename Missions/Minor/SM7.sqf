//Axe murderer script by TheSzerdi with credit to TAW_Tonic

private ["_coords","_wait","_dummymarker","_grouparray","_group"];
_wait = [600,300] call fnc_hTime;
sleep _wait;

[nil,nil,rTitleText,"A psychotic axe murderer has escaped from the hospital!", "PLAIN",6] call RE;
[nil,nil,rGlobalRadio,"A psychotic axe murderer has escaped from the hospital!"] call RE;
[nil,nil,rHINT,"A psychotic axe murderer has escaped from the hospital!"] call RE;

_coords = [getMarkerPos "center",0,4000,5,0,2000,0] call BIS_fnc_findSafePos;

_dummymarker = createMarker["Axe Murderer", _coords];
_dummymarker setMarkerColor "ColorRed";
_dummymarker setMarkerShape "ELLIPSE";
_dummymarker setMarkerBrush "Grid";
_dummymarker setMarkerSize [75,75];

[_coords,80,4,1,2] execVM "\z\addons\dayz_server\Missions\add_unit_server2.sqf";//AI Guards
sleep 1;
waitUntil{({alive _x} count (units AxeMurderer)) < 1};

[nil,nil,rTitleText,"Finally! He died! Check the body for medical supplies!", "PLAIN",6] call RE;
[nil,nil,rGlobalRadio,"Finally! He died! Check the body for medical supplies!"] call RE;
[nil,nil,rHINT,"Finally! He died! Check the body for medical supplies!"] call RE;

deleteMarker _dummymarker;
SM1 = 1;
[0] execVM "\z\addons\dayz_server\missions\Minor\SMfinder.sqf";
