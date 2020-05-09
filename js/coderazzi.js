//responsive menu
var menu=document.getElementById('menu');

var nav=menu.getElementsByClassName('navcontainer')[0];

var timeoutId;

menu.onclick=function(){
	if (getStyle(nav,'display')==='none') { //navcontainer is hidden
		nav.style.display='block';
		resetTimeout(8000);
	} else {
		hideResponsiveMenu();
	}
};

function getStyle(element, prop){
	if(window.getComputedStyle) return getComputedStyle(element).getPropertyValue(prop);
	try { return element.currentStyle[prop];} 
	catch (e) { return ''; }
}

function hideResponsiveMenu(){
	if (getStyle(menu, 'float')==='none'){ //not hidden, but perhaps the menu is not on responsive mode		
		nav.style.display='none';
		resetTimeout();
	}	
}

function resetTimeout(time){
	if (timeoutId) {
		clearTimeout(timeoutId);
		timeoutId=null;
	}
	if (time){
		timeoutId=setTimeout(hideResponsiveMenu, time);
	}
}

window.onkeydown = function( event ) {
    if (event.keyCode===27) {
    	hideResponsiveMenu();
    }
};
