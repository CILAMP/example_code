/*

This is an example of how to control a CILAMP from server-side JavaScript
(node JS).

It will simply change the color to red for system ID 'testsystem'.

How to use:
1. Install NodeJS (google it!)
2. Install Node-fetch:
	npm install node-fetch
3. Run this script:
	node nodejs_example.js

*/

var fetch = require('node-fetch');

function setColor(systemid, color) {
	console.log("Setting systemid " + systemid + " to " + color);
    var body = 'color=' + color;
    var options = {
        method: 'POST',
        body: body,
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
            'Content-Length': new Buffer(body).length
        }
    };

    fetch('https://api.cilamp.se/v1/' + systemid, options)
        .then(function(res) {
            console.log("Response from CILAMP API:");
            console.log("Response code: " + res.status);
            console.log("Response text: " + res.statusText);
        })
        .catch(function(msg) {
            console.log(msg);
        });

}

setColor('testsystem', '#ff0000');
