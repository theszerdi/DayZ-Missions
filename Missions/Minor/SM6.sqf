//ural wreck Mission by TheSzerdi with credit to TAW_Tonic
private ["_coords","_itemType","_itemChance","_weights","_index","_iArray","_num","_nearby","_checking","_people","_wait","_dummymarker"];
_wait = [600,300] call fnc_hTime;
sleep _wait;
[nil,nil,rTitleText,"A truck has crashed! Kill any survivors and secure the loot!", "PLAIN",6] call RE;
[nil,nil,rGlobalRadio,"A truck has crashed! Kill any survivors and secure the loot!"] call RE;
[nil,nil,rHINT,"A truck has crashed! Kill any survivors and secure the loot!"] call RE;

_coords = [getMarkerPos "center",0,12000,10,0,2000,0] call BIS_fnc_findSafePos;

_dummymarker = createMarker["Ural Wreck", _coords];
_dummymarker setMarkerColor "ColorRed";
_dummymarker setMarkerShape "ELLIPSE";
_dummymarker setMarkerBrush "Grid";
_dummymarker setMarkerSize [75,75];

uralcrash = createVehicle ["uralwreck",_coords,[], 0, "CAN_COLLIDE"];
uralcrash setVariable ["Mission",1,true];

[_coords,40,4,3,0] execVM "\z\addons\dayz_server\Missions\add_unit_server.sqf";//AI Guards
sleep 1;

if (isDedicated) then {

  _num = round(random 5) + 1;
	_itemType =		[["FN_FAL", "weapon"], ["bizon_silenced", "weapon"], ["M14_EP1", "weapon"], ["BAF_AS50_scoped", "weapon"], ["MakarovSD", "weapon"], ["Mk_48_DZ", "weapon"], ["M249_DZ", "weapon"], ["DMR", "weapon"], ["", "military"], ["", "medical"], ["MedBox0", "object"], ["NVGoggles", "weapon"], ["AmmoBoxSmall_556", "object"], ["AmmoBoxSmall_762", "object"], ["Skin_CamoWinter_DZN", "magazine"], ["Skin_CamoWinterW_DZN", "magazine"], ["Skin_Sniper1_DZ", "magazine"], ["Skin_Sniper1W_DZN", "magazine"]];
	_itemChance =	[0.02,					 0.05,							 0.05, 					0.01, 				0.03, 						0.02, 					0.03, 				0.05, 				0.1, 				0.1, 			0.2, 						0.07, 					0.01, 							0.01, 							0.08, 								0.05, 								0.08, 								0.05];
	
	waituntil {!isnil "fnc_buildWeightedArray"};
	
	_weights = [];
	_weights = 		[_itemType,_itemChance] call fnc_buildWeightedArray;
	//diag_log ("DW_DEBUG: _weights: " + str(_weights));	
	for "_x" from 1 to _num do {
		//create loot
		_index = _weights call BIS_fnc_selectRandom;
		sleep 1;
		if (count _itemType > _index) then {
			//diag_log ("DW_DEBUG: " + str(count (_itemType)) + " select " + str(_index));
			_iArray = _itemType select _index;
			_iArray set [2,_coords];
			_iArray set [3,5];
			_iArray call spawn_loot;
			_nearby = _coords nearObjects ["WeaponHolder",20];
			{
				_x setVariable ["permaLoot",true];
			} forEach _nearBy;
		};
	};
};

_checking = 1;
while {_checking == 1} do {
_people =  nearestObjects [_coords,["Man"],20];
if ({isPlayer _x} count _people > 0) then {_checking = 0};
sleep 1;
};
deleteMarker _dummymarker;

[nil,nil,rTitleText,"Good work you've secured the crash site!", "PLAIN",6] call RE;
[nil,nil,rGlobalRadio,"Good work you've secured the crash site!"] call RE;
[nil,nil,rHINT,"Good work you've secured the crash site!"] call RE;

SM1 = 5;
[0] execVM "\z\addons\dayz_server\missions\Minor\SMfinder.sqf";
