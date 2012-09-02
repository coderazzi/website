$(function() {
	var SIDE=240;
	var RADIO=24;
	var SELECTED_COLOR='#5Bc5fF', HOVER_COLOR='blue', NONE_COLOR='yellow';

	var sectionSize = SIDE / 2 - RADIO, diameter = 2 * RADIO;
	var selected = 4, hovered = -1;
	var maps=$('#map_div').children();

	var getSidePosition = function(x){
		var ret = Math.floor(x / sectionSize);
		return (x - sectionSize * ret <= diameter) ? ret : -1;
	}
	var getPosition = function (self, event){
		var offset = $(self).offset();
		var x = getSidePosition(event.pageX-offset.left);
		var y = getSidePosition(event.pageY-offset.top);
		return x===-1 || y===-1 ? -1 : 3 * y + x;
	}
	var colorize = function(which, color){
		if (which!==-1) $(maps[which]).css({'background-color': color});
	}

	$('#map_div').mouseout(function(){
		colorize(hovered, NONE_COLOR);
		hovered=-1;
	}).click(function(event){
		colorize(selected, NONE_COLOR);
		var position=getPosition(this, event);
		if (selected===position){
			selected=-1;
		} else {
			selected=position;
			colorize(selected, SELECTED_COLOR);
		}
		hovered=-1;
	}).mousemove(function(event){
		var pos=getPosition(this, event);
		if (pos!==hovered){
			colorize(hovered, NONE_COLOR);
			if (pos !== selected){
				colorize(hovered = pos, HOVER_COLOR);	
			}
		}
	});
	colorize(selected, SELECTED_COLOR);
});