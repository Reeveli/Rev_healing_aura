/*
 * Author: Reeveli 
 * Client side function to start dynamic ZEN dialog to adjust healing radius settings
 *
 * Arguments: NONE
 *
 * Return Value: NONE
 *
 * Example:
 * [] execVM "scripts\mission\scripts\heal_radius_settings.sqf"
 *
 */

private _state = missionNamespace getVariable ["Rev_healing_sate",true];
private _time = missionNamespace getVariable ["Rev_healing_time",30];
private _range = missionNamespace getVariable ["Rev_healing_radius",12];

[
	"Adjust healing radius settings",
	[
		["TOOLBOX:ENABLED",["Enable healing radius",""],[_state],false],
		["SLIDER",["Healign time"],[0,300,_time,0],false],
		["SLIDER",["Healign range"],[0,100,_range,0],false]
	],
	{
		params ["_results","_passed_arguments"];
		private _stateAdjusted = _results select 0;
		private _timeAdjusted = _results select 1;
		private _radius = _results select 2;

		missionNamespace setVariable ["Rev_healing_state",_stateAdjusted,true];
		missionNamespace setVariable ["Rev_healing_time",_timeAdjusted,true];
		missionNamespace setVariable ["Rev_healing_radius",_radius,true];
		
		[objNull, "Settings altered"] call BIS_fnc_showCuratorFeedbackMessage;

	},
	{
		playSound "FD_Start_F";
		[objNull, "Dialog closed"] call BIS_fnc_showCuratorFeedbackMessage;
	},
	[]
] call zen_dialog_fnc_create;