/*
 * Author: Reeveli 
 * Client side function to toggle a unit as healing source
 *
 * Arguments: NONE
 *
 * Return Value: NONE
 *
 * Example:
 * [_this select 1] execVM "scripts\mission\scripts\heal_radius_unit.sqf"
 *
 */



params [
	["_unit", objNull, [objNull]]
];

if (isNull _unit) exitwith
{
	playSound "FD_Start_F";
	[objNull, "No object was selected!"] call BIS_fnc_showCuratorFeedbackMessage;
};

//Demotion
if (_unit getVariable ["Rev_healing_unit", false]) exitWith {
	_unit setVariable ["Rev_healing_unit", false,true];

	playSound "FD_Start_F";
	private _string = name _unit + " is no longer healing";
	[objNull, _string] call BIS_fnc_showCuratorFeedbackMessage;
};

//Promotion
private _string = name _unit + " is now healer";
_unit setVariable ["Rev_healing_unit", true,true];
[objNull, _string] call BIS_fnc_showCuratorFeedbackMessage;
["Rev_healing_aura",[_unit],_unit] call CBA_fnc_localEvent;
["Rev_healing_text",[],_unit] call CBA_fnc_localEvent;