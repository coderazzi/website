//google analytics
(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
})(window,document,'script','//www.google-analytics.com/analytics.js','ga');

ga('create', 'UA-16271101-1', 'auto');
ga('send', 'pageview');


//responsive menu
var menu=document.getElementById('menu');

var nav=menu.getElementsByClassName('navcontainer')[0];

menu.onclick=function(){
	if (nav.offsetParent===null){ //navcontainer is hidden
		nav.style.display='block';
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
	}	
}

window.onkeydown = function( event ) {
    if (event.keyCode===27) {
    	hideResponsiveMenu();
    }
};
