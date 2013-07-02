//Created by TheSzerdi
while {MissionGoMinor == 1} do {
waitUntil{{isPlayer _x && _x distance Mcoords < 200  } count playableunits > 0};
_piggy = [objNull, player, rSAY, "hillbilly"] call RE;
sleep 180;
};
