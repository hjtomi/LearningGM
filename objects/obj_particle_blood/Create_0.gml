//ps_blood
var _ps = part_system_create();
part_system_draw_order(_ps, true);

//Blood
var _ptype1 = part_type_create();
part_type_shape(_ptype1, pt_shape_line);
part_type_size(_ptype1, 1, 1, 0, 0);
part_type_scale(_ptype1, 0.4, 0.3);
part_type_speed(_ptype1, 10, 8, 0, 0);
part_type_direction(_ptype1, 225, 315, 0, 0);
part_type_gravity(_ptype1, 0.7, 270);
part_type_orientation(_ptype1, 0, 0, 0, 0, true);
part_type_colour3(_ptype1, $CCCCFF, $0000FF, $FF1900);
part_type_alpha3(_ptype1, 1, 1, 0);
part_type_blend(_ptype1, false);
part_type_life(_ptype1, 10, 15);

var _pemit1 = part_emitter_create(_ps);
part_emitter_region(_ps, _pemit1, -16, 16, -4, 4, ps_shape_rectangle, ps_distr_linear);
part_emitter_burst(_ps, _pemit1, _ptype1, 10);
part_emitter_delay(_ps, _pemit1, 2, 2, time_source_units_seconds)

part_system_position(_ps, x, y);

