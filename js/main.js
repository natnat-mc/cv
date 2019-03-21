(fn => {
	if(document.readyState=='complete') return fn();
	else document.addEventListener('DOMContentLoaded', fn);
})(() => {
	// make all modal exit links work
	document.querySelectorAll('.modal .exit').forEach(link => {
		link.addEventListener('click', () => {
			link.parentNode.classList.remove('active');
		});
	});
	
	// Read mode...
	document.querySelector('#mainCard .readmore').addEventListener('click', () => {
		document.querySelector('#contentWrapper').classList.add('active');
	});
	
	// Credits
	document.querySelector('#creditsLink').addEventListener('click', () => {
		document.querySelector('#creditsWrapper').classList.add('active');
	});
});
