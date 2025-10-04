//Healing area radius in meters (default:12). Can be adjusted in-game via curator module in Reeveli's Mission Modules
missionNamespace setVariable ["Rev_healing_radius",12,false];

//Healing area time, i.e. how often it fires in seconds (default:30). Can be adjusted in-game via curator module in Reeveli's Mission Modules
missionNamespace setVariable ["Rev_healing_time",10,false];


//Aura
private _power = ["Rev_healing_aura", {
	params ["_unit"];
	//Safety exit if no longer healing unit
	if !(_unit getVariable ["Rev_healing_unit", false]) exitWith {};	
	//Only fire healing if allowed
	if (missionNamespace getVariable ["Rev_healing_state",true]) then {
		[_unit] call Rev_fnc_heal_area;
	};
	//Fire next loop
	private _time = missionNamespace getVariable ["Rev_healing_time",30];
[{["Rev_healing_aura",[_this#0]] call CBA_fnc_localEvent;}, [_unit], _time] call CBA_fnc_waitAndExecute;
}] call CBA_fnc_addEventHandler;
missionNamespace setVariable ["Rev_healing_EH",_power,false];

//Promotion text event
private _Popup = ["Rev_healing_text", {
	params ["_unit"];
	["You are now a healer", 0, 0.1*safeZoneH+safeZoneY, 5, 0, 0, 800] spawn BIS_fnc_dynamicText;

}] call CBA_fnc_addEventHandler;