/*
 * Author: Reeveli
 * Client side function to create custom ZEN modules and context actions for curators. Called as a postinit.
 */

if !(hasInterface) exitWith {};



//ZEN modules
if (isClass (configFile >> "CfgPatches" >> "zen_custom_modules")) then
{
	//Mission specific
	["Reeveli's Mission Modules", "Injure Unit", {[_this select 1] call Rev_fnc_injury},"\x\zen\addons\context_actions\ui\medical_cross_ca.paa"] call zen_custom_modules_fnc_register;
	["Reeveli's Mission Modules", "Heal radius settings", {[] execVM "scripts\mission\scripts\heal_radius_settings.sqf";},""] call zen_custom_modules_fnc_register;
	["Reeveli's Mission Modules", "Set healing unit", {[_this select 1] execVM "scripts\mission\scripts\heal_radius_unit.sqf";},"\x\zen\addons\context_actions\ui\medical_cross_ca.paa"] call zen_custom_modules_fnc_register;
};
