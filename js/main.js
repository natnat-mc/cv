(fn => {
	if(document.readyState=='complete') return fn();
	else document.addEventListener('DOMContentLoaded', fn);
})(() => {
	document.querySelector('#mainCard .readmore').addEventListener('click', () => {
		document.querySelector('#contentWrapper').classList.add('active');
	});
	document.querySelector('#contentWrapper .exit').addEventListener('click', () => {
		document.querySelector('#contentWrapper').classList.remove('active');
	});
});
