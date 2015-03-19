/*
 * Author: Garth 'L-H' de Wet and CAA-Picard
 *
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Actions
 *
 * Public: No
 */
#include "script_component.hpp"
private ["_mags", "_item", "_index", "_actions"];

EXPLODE_1_PVT(_this,_unit);

_mags = magazines _unit;
_list = [];
_itemCount = [];
{
    _item = ConfigFile >> "CfgMagazines" >> _x;
    if (getNumber(_item >> "ACE_Placeable") == 1) then {
        _index = _list find _item;
        if (_index != -1) then {
            _itemCount set [_index, (_itemCount select _index) + 1];
        } else {
            _list pushBack _item;
            _itemCount pushBack 1;
        };
    };
} forEach _mags;

_children = [];

{
    _action = [
        [format ["Explosive_%1", _forEachIndex]],
        format [getText(_x >> "displayName") + " (%1)", _itemCount select _foreachIndex],
        getText(_x >> "picture"),
        "",
        {(_this select 2) call FUNC(openTriggerSelectionUI)},
        {true},
        2,
        [false,false,false,false],
        {},
        [configName _x]
    ] call EFUNC(interact_menu,createAction);

    _action pushBack _unit;
    _children pushBack _action

} foreach _list;

_children
