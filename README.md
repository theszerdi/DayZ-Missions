DayZ-Missions by TheSzerdi
=============

<h3>This version tested only on Namalsk 0.741. It <i>should</i> work. Good luck.</h3>
<h4>You may need to customize the weapons loadouts for the NPC's and fillBoxes.sqf -- Also, you may need to change which vehicles spawn for major missions SM4, SM5, and SM6. Major mission coords are hardcoded in this version, you WILL need to change them if not using Namalsk or substitute the find safe pos function.</h4>

<b>In your server.pbo:</b>

Add the Missions folder and associated files.

Add to server_functions.sqf place compile near beginning:

    fnc_hTime = compile preprocessFile "\z\addons\dayz_server\Missions\misc\fnc_hTime.sqf"; //Random integer selector for mission wait time

Add to server_functions.sqf near end:

        //----------InitMissions--------//
        MissionGo = 0;
        MissionGoMinor = 0;
        if (isServer) then { 
        SMarray = ["SM1","SM2","SM3","SM4","SM5","SM6","SM7"];
        [] execVM "\z\addons\dayz_server\missions\major\SMfinder.sqf"; //Starts major mission system
    	SMarray2 = ["SM1","SM2","SM3","SM4","SM5","SM6","SM7"];
    	[] execVM "\z\addons\dayz_server\missions\minor\SMfinder.sqf"; //Starts minor mission system
        };
        //---------EndInitMissions------//

Add to server_updateObject.sqf place right after terms defined:

    if (_object getVariable "Mission" == 1) exitWith {};


Change line in server_cleanup.fsm around line 349 in the Check for Hacker section:

    if(vehicle _x != _x && (vehicle _x getVariable [""Mission"",0] != 1) && !(vehicle _x in _safety) && (typeOf vehicle _x) != ""ParachuteWest"") then {" \n

IF YOU HAVE SARGE AI INSTALLED YOU NEED TO CHANGE THE VEHICLE VARIABLE IN EACH MISSION TO "SARGE" INSTEAD OF USING "MISSIONS" (Not tested with SARGE AI, may be incompatible.)


<b>In your mission.pbo:</b>

Add this to end of init.sqf:

        [] execVM "debug\addmarkers.sqf";
        [] execVM "debug\addmarkers75.sqf";

Add the debug folder and all associated files.

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

The AI require faction settings. If you have SARGE AI you're good to go. Otherwise add faction.sqf to your mission.pbo and add this line to your init.sqf:

    [] execVM "faction.sqf";

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


<b>Other stuff:</b>

In the Missions\Minor\SM3.sqf you must specify your own coords for the NPC's/PBX to spawn and the landing point on beach. Coords used are for Namalsk only.

In the createvehicle.txt comment out the SMAW lines and the Mine lines.
