// by burn
if (!isServer) exitWith {};
_barrel = _this select 0;
_killer = _this select 1;

_killer addScore 3;	//add lost score point

_speed = random 9;
_dir = random 359;
_zvel = 15 + (random 15);


sleep (random 1);
_boom = "Bomb_04_F" createVehicle (position _barrel);
sleep 0.4;
_barrel setVelocity [_speed * sin(_dir), _speed * cos(_dir), _zvel];