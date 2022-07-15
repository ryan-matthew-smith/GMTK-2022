function movement_create(){
	x_move = 0;
	y_move = 0;
	
	x_move_bank = 0;
	y_move_bank = 0;
	
	x_push = 0;
	y_push = 0;
}

function movement_calculate(){
	x_move = clamp(x_move,-TERM_VELOC,TERM_VELOC);
	x_move_bank += x_move;
	var _x_move = sign(x_move_bank) * abs(floor(x_move_bank));
	x_move_bank -= _x_move;
	
	y_move = clamp(y_move,-TERM_VELOC,TERM_VELOC);
	y_move_bank += y_move;
	var _y_move = sign(y_move_bank) * abs(floor(y_move_bank));
	y_move_bank -= _y_move;
	
	var _dir = point_direction(x,y,x+_x_move,y+_y_move);
	var _dist = point_distance(x,y,x+_x_move,y+_y_move);
	_x_move = lengthdir_x(_dist,_dir);
	_y_move = lengthdir_y(_dist,_dir);
	
	var _array = [];
	_array[AXIS.X] = _x_move;
	_array[AXIS.Y] = _y_move;
	
	return _array;
}