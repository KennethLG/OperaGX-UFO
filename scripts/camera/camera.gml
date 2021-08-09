// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function canDelete(_id) {
	return (_id.bbox_top > (camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])));
}

//function scaleCanvas(_bw, _bh, _cw, _ch, _center) {
//	var _aspect = (_bw / _bh);

//	if ((_cw / _aspect) > _ch)
//	    {
//	    window_set_size((_ch *_aspect), _ch);
//	    }
//	else
//	    {
//	    window_set_size(_cw, (_cw / _aspect));
//	    }
//	if (_center)
//	    {
//	    window_center();
//	    }

//	view_wport[0] = min(window_get_width(), _bw);
//	view_hport[0] = min(window_get_height(), _bh)
//	surface_resize(application_surface, view_wport[0], view_hport[0]);
//}


function canvasFullscreen(_base) {
	var _bw = browser_width;
	var _bh = browser_height;

	view_wport[0] = _bw;
	view_hport[0] = _bh;
	window_set_size(_bw, _bh);
	window_center();

	var _aspect = (_bw / _bh);
	if (_aspect < 1)
	    {
	    var _vw = _base * _aspect;
	    var _vh = _base;
	    }
	else
	    {
	    _vw = _base;
	    _vh = _base / _aspect;
	    }

	camera_set_view_size(view_camera[0], _vw, _vh);
	surface_resize(application_surface, view_wport[0], view_hport[0]);
}

