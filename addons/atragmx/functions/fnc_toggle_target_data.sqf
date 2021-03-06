/*
 * Author: Ruthberg
 * Toggles the target data screen on/off
 *
 * Arguments:
 * Apply new data? <NUMBER>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * 1 call ace_atragmx_fnc_toggle_target_data
 *
 * Public: No
 */
#include "script_component.hpp"

if (ctrlVisible 14000) then {
    false call FUNC(show_target_data);
    true call FUNC(show_main_page);

    if (_this == 1) then {
        call FUNC(calculate_target_solution);
    };
} else {
    true call FUNC(show_target_data);
    false call FUNC(show_main_page);
};
