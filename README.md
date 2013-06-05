DayZ-Missions
=============
In your server.pbo:

Add to server_functions.sqf place compile near beginning and if (isServer) near end:

    fnc_hTime = compile preprocessFile "\z\addons\dayz_server\Missions\misc\fnc_hTime.sqf"; //Random integer selector for mission wait time
    if (isServer) then { 
      SMarray = ["SM1","SM2","SM3","SM4","SM5","SM6","SM7"];
    	[] execVM "\z\addons\dayz_server\missions\Major\SMfinder.sqf"; //Starts major mission system
    	SMarray2 = ["SM1","SM2","SM3","SM4","SM5","SM6","SM7"];
    	[] execVM "\z\addons\dayz_server\missions\Minor\SMfinder.sqf"; //Starts minor mission system
    };

Add to server_updateObject.sqf place right after terms defined:

    if (_object getVariable "Mission" == 1) exitWith {};


Change line in server_cleanup.fsm around line 349 in the Check for Hacker section:

    if(vehicle _x != _x && (vehicle _x getVariable [""Mission"",0] != 1) && !(vehicle _x in _safety) && (typeOf vehicle _x) != ""ParachuteWest"") then {" \n

IF YOU HAVE SARGE AI INSTALLED YOU NEED TO CHANGE THE VEHICLE VARIABLE IN EACH MISSION TO "SARGE" INSTEAD OF USING "MISSIONS"


In your mission.pbo:

In your description.ext paste this at end:

    class CfgSounds
    {
      sounds[] = {};
      
        class hillbilly
      {
        name="hillbilly";
        sound[]={hillbilly.ogg,0.9,1};
        titles[] = {};
      };
    };


In the Missions\Minor\SM3.sqf you must specify your own coords for the NPC's/PBX to spawn and the landing point on beach. Coords used are for Namalsk only.

In the createvehicle.txt comment out the SMAW lines and the Mine lines.

If your map does not have a marker named "Center" in the middle of map you must add one to the mission.sqm in the mission.pbo

    	class Markers
    	{
    		items=7;
    		class Item0
    		{
    			position[]={5406.9092,30.012478,8796.7354};
    			name="center";
    			type="Empty";
      	  };