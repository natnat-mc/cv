(fn => {
	if(document.readyState=='complete') return fn();
	else document.addEventListener('DOMContentLoaded', fn);
})(() => {
	document.querySelector('#mainCard .readmore').addEventListener('click', () => {
		document.querySelector('#contentBox').classList.add('active');
	});
});
