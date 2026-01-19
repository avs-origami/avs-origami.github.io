'use strict';

document.addEventListener('DOMContentLoaded', function ()
{
	const email = document.getElementById('text-obfu').firstChild;

	email.nodeValue = email.nodeValue
		.replace(' ', '@')
		.replaceAll(' ', '.')
		.replaceAll(new RegExp('[zuy]', 'g'), '')
		.replace('example', 'gmail');
});

document.addEventListener('DOMContentLoaded', function ()
{
	const a = document.getElementsByClassName('href-obfu');
    
    for (var i = 0; i < a.length; i++) {
	    a[i].setAttribute('href', a[i].getAttribute('href')
		    .replace('-', 'vs.origami@')
		    .replace('/', '.com')
		    .replace('to', 'mailto:a')
	    );
    }
});
