//Created by Axeman Edited by TheSzerdi
private ["_aiunit","_xpos","_ypos","_unitpos","_aiGroup","_wppos","_wpradius","_wpnum","_levelnum","_numunits","_rndLOut","_ailoadout","_wp","_aispawnpos","_aiwep1","_aiammo1","_aiwep2","_aiammo2"];
 
    _aiunit = objNull;
    _aiGroup = createGroup resistance;
    _aispawnpos =_this select 0;
    _wpradius = _this select 1;
    _wpnum = _this select 2;
    _numunits = _this select 3;
    _levelnum = _this select 4;
	SniperTeam = createGroup resistance;
	AxeMurderer = createGroup resistance;
	publicVariable "SniperTeam";
	publicVariable "AxeMurderer";
 
    _xpos = _aispawnpos select 0;
    _ypos = _aispawnpos select 1;
 
    diag_log format ["AIUNIT: Spawn initiated: Centre:%1 | Radius in m:%2 | Waypoint number:%3 | WeaponLevel:%4",_aispawnpos,_wpradius,_wpnum,_levelnum];
 
    for [{ x=1 },{ x < _numunits+1 },{ x = x + 1; }] do
    {
        _unitpos = [_xpos+x,_ypos+x,0];
 
        if (_levelnum==0) then // in_sityes troops
        {
            if ((x == 1) || (x == 3) || (x == 5)) then //troop soldiers
            {
                "Survivor2_DZ" createUnit [_unitpos, _aiGroup, "_aiunit=this;",1,"PRIVATE"];
                _rndLOut=floor(random 4);
                _ailoadout=
                switch (_rndLOut) do
                {
                  case 0: {["M1014","8Rnd_B_Beneli_74Slug","revolver_EP1","6Rnd_45ACP"]};
                  case 1: {["M1014","8Rnd_B_Beneli_Pellets","revolver_EP1","6Rnd_45ACP"]};
                  case 2: {["Remington870_lamp","8Rnd_B_Beneli_74Slug","Colt1911","7Rnd_45ACP_1911"]};
                  case 3: {["Remington870_lamp","8Rnd_B_Beneli_Pellets","Colt1911","7Rnd_45ACP_1911"]};
                };
            };
            if ((x == 2) || (x == 4) || (x >= 6)) then //troops snipers
            {
                "Survivor2_DZ" createUnit [_unitpos, _aiGroup, "_aiunit=this;",1,"PRIVATE"];
                _rndLOut=floor(random 3);
                _ailoadout=
                switch (_rndLOut) do
                {
                  case 0: {["LeeEnfield","10x_303","Makarov","8Rnd_9x18_Makarov"]};
                  case 1: {["Huntingrifle","5x_22_LR_17_HMR","Makarov","8Rnd_9x18_Makarov"]};
                  case 2: {["M14_EP1","20Rnd_762x51_DMR","Makarov","8Rnd_9x18_Makarov"]};
                };
            };
        };
        if (_levelnum==1) then //in_military troops
        {
            if (x == 1) then //one troops comander
            {
                "BAF_Soldier_Sniper_MTP" createUnit [_unitpos, SniperTeam, "_aiunit=this;",1,"LIEUTENANT"];
         
                _rndLOut=floor(random 4);
                _ailoadout=
                switch (_rndLOut) do
                {
                  case 0: {["SVD_CAMO","10Rnd_762x54_SVD","Sa61_EP1","20Rnd_B_765x17_Ball"]};
                  case 1: {["M24","5Rnd_762x51_M24","Sa61_EP1","20Rnd_B_765x17_Ball"]};
                  case 2: {["M40A3","5Rnd_762x51_M24","Sa61_EP1","20Rnd_B_765x17_Ball"]};
                  case 3: {["VSS_vintorez_DZN","20Rnd_9x39_SP5_VSS","Sa61_EP1","20Rnd_B_765x17_Ball"]};
                };
            };
            if ((x == 2) || (x == 3)) then //troops sergeant
            {
                "BAF_Soldier_Sniper_MTP" createUnit [_unitpos, SniperTeam, "_aiunit=this;",1,"SERGEANT"];
         
                _rndLOut=floor(random 4);
                _ailoadout=
                switch (_rndLOut) do
                {
                  case 0: {["SVD_CAMO","10Rnd_762x54_SVD","Sa61_EP1","20Rnd_B_765x17_Ball"]};
                  case 1: {["M24","5Rnd_762x51_M24","Sa61_EP1","20Rnd_B_765x17_Ball"]};
                  case 2: {["M40A3","5Rnd_762x51_M24","Sa61_EP1","20Rnd_B_765x17_Ball"]};
                  case 3: {["VSS_vintorez_DZN","20Rnd_9x39_SP5_VSS","Sa61_EP1","20Rnd_B_765x17_Ball"]};
                };
            };
            if (x > 3) then //troops soldiers
            {
                "BAF_Soldier_Sniper_MTP" createUnit [_unitpos, SniperTeam, "_aiunit=this;",1,"CORPORAL"];
         
                _rndLOut=floor(random 4);
                _ailoadout=
                switch (_rndLOut) do
                {
                  case 0: {["SVD_CAMO","10Rnd_762x54_SVD","Sa61_EP1","20Rnd_B_765x17_Ball"]};
                  case 1: {["M24","5Rnd_762x51_M24","Sa61_EP1","20Rnd_B_765x17_Ball"]};
                  case 2: {["M40A3","5Rnd_762x51_M24","Sa61_EP1","20Rnd_B_765x17_Ball"]};
                  case 3: {["VSS_vintorez_DZN","20Rnd_9x39_SP5_VSS","Sa61_EP1","20Rnd_B_765x17_Ball"]};
                };
            };
        };
        if (_levelnum==2) then // in_sityes troops
        {
            if ((x == 1) || (x == 3) || (x == 5)) then //troop soldiers
            {
                "Bandit1_DZ" createUnit [_unitpos, AxeMurderer, "_aiunit=this;",1,"PRIVATE"];
                _ailoadout= ["MeleeHatchet","5Rnd_762x51_M24","Makarov","20Rnd_B_765x17_Ball"]
            };
        };
        diag_log format ["AIUNIT: Creating BAF_Soldier_L_DDPM by %1 at %2. Result:%3 | Loadout:%4 / Num:%5",player,_unitpos,_aiunit,_ailoadout,_rndLOut];
 
        _aiunit enableAI "TARGET";
        _aiunit enableAI "AUTOTARGET";
        _aiunit enableAI "MOVE";
        _aiunit enableAI "ANIM";
        _aiunit enableAI "FSM";
        _aiunit allowDammage true;
		
		_aiunit addEventHandler ['killed',{_this execVM "\z\addons\dayz_server\Missions\bodyclean.sqf"}]; //Body disappear time
 
        _aiunit setCombatMode "RED";
        _aiunit setBehaviour "COMBAT";
 
        //clear default weapons / ammo
        removeAllWeapons _aiunit;
        //add random selection
        _aiwep1 = _ailoadout select 0;
        _aiammo1 = _ailoadout select 1;
        _aiwep2 = _ailoadout select 2;
        _aiammo2 = _ailoadout select 3;
        _aiunit addweapon _aiwep1;
        _aiunit addMagazine _aiammo1;
        _aiunit addMagazine _aiammo1;
        _aiunit addMagazine _aiammo1;
        _aiunit addweapon _aiwep2;
        _aiunit addMagazine _aiammo2;
        _aiunit addMagazine _aiammo2;
		removeBackpack _aiunit;
		_aiunit addBackpack "BAF_AssaultPack_DZN";
		clearWeaponCargo (unitBackpack _aiunit);
		clearMagazineCargo (unitBackpack _aiunit);
      //add some garbage
        if (x == 1) then {
        _aiunit addMagazine "SmokeShellGreen";
        _aiunit addMagazine "HandGrenade_West";
        _aiunit addMagazine "FoodCanBakedBeans";
        _aiunit addMagazine "ItemSodaCoke";
        _aiunit addMagazine "ItemPainkiller";
        _aiunit addMagazine "ItemHeatPack";
        _aiunit addMagazine "ItemEpinephrine";
        _aiunit addMagazine "ItemMorphine";
        };
        if (x == 2) then {
        _aiunit addMagazine "ItemHeatPack";
        _aiunit addMagazine "ItemPainkiller";
        _aiunit addMagazine "ItemEpinephrine";
        _aiunit addMagazine "ItemMorphine";
        };
        if (x >= 3) then {
        _aiunit addMagazine "ItemHeatPack";
        _aiunit addMagazine "ItemBandage";
        };
		
		if (_levelnum==2) then {
			_aiunit addEventHandler ["HandleDamage",{if (_this select 1!="") then {_unit=_this select 0;damage _unit+((_this select 2)-damage _unit)*0.2}}];
			removeAllWeapons _aiunit;
			_aiwep1 = _ailoadout select 0;
			_aiunit addweapon _aiwep1;
			removeBackpack _aiunit;
			_aiunit addBackpack "DZ_Backpack_EP1";
			clearWeaponCargo (unitBackpack _aiunit);
			clearMagazineCargo (unitBackpack _aiunit);
			unitBackpack _aiunit addMagazineCargo ["ItemBloodbag",5];
			unitBackpack _aiunit addMagazineCargo ["ItemPainkiller",2];
			unitBackpack _aiunit addMagazineCargo ["ItemMorphine",2];
			unitBackpack _aiunit addMagazineCargo ["ItemBandage",4];
			unitBackpack _aiunit addMagazineCargo ["FoodCanBakedBeans",2];
			unitBackpack _aiunit addMagazineCargo ["ItemSodaCoke",2];
			unitBackpack _aiunit addMagazineCargo ["ItemJerryCan",1];
			unitBackpack _aiunit addMagazineCargo ["PipeBomb",2];
		};
		if (_levelnum==1) then {
			removeBackpack _aiunit;
			_aiunit addBackpack "DZ_CivilBackpack_EP1";
			clearWeaponCargo (unitBackpack _aiunit);
			clearMagazineCargo (unitBackpack _aiunit);
			unitBackpack _aiunit addWeaponCargo ["Binocular_Vector",1];
			unitBackpack _aiunit addMagazineCargo ["ItemBloodbag",1];
			unitBackpack _aiunit addMagazineCargo ["ItemPainkiller",1];
			unitBackpack _aiunit addMagazineCargo ["ItemMorphine",1];
			unitBackpack _aiunit addMagazineCargo ["ItemBandage",2];
			unitBackpack _aiunit addMagazineCargo ["FoodCanBakedBeans",2];
			unitBackpack _aiunit addMagazineCargo ["ItemSodaCoke",2];
			unitBackpack _aiunit addMagazineCargo ["PipeBomb",2];
			unitBackpack _aiunit addMagazineCargo ["Mine",2];
		};
		
		
        //set skills
        _aiunit setSkill ["aimingAccuracy",0.6];
        _aiunit setSkill ["aimingShake",0.7];
        _aiunit setSkill ["aimingSpeed",0.8];
        _aiunit setSkill ["endurance",0.9];
        _aiunit setSkill ["spotDistance",0.8];
        _aiunit setSkill ["spotTime",0.7];
        _aiunit setSkill ["courage",0.9];
        _aiunit setSkill ["reloadSpeed",1];
        _aiunit setSkill ["commanding",1];
        _aiunit setSkill ["general",1];
        //sleep 0.5;
    };
    //generate waypoints
    for [{ x=1 },{ x < _wpnum },{ x = x + 1; }] do {
    _wppos = [_xpos+(x*20),_ypos+(x*20),_wpradius];
    _wp = _aiGroup addWaypoint [_wppos, _wpradius];
    _wp setWaypointType "MOVE";
    };
    _wp = _aiGroup addWaypoint [[_xpos,_ypos,0], _wpradius];
    _wp setWaypointType "CYCLE";
 
    diag_log format ["AIUNIT: Last Waypoint %1 at %2",_wp,_wppos];