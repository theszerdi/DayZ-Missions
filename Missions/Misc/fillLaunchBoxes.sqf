_crate = _this select 0;

clearWeaponCargoGlobal _crate;
clearMagazineCargoGlobal _crate;

// Weapons
_crate addWeaponCargoGlobal ["SMAW", 3];

_crate addMagazineCargoGlobal ["SMAW_HEAA", 15];

_crate addMagazineCargoGlobal ["SMAW_HEDP", 15];
