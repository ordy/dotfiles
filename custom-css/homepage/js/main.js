function dateTime() {
	const date = new Date();
	let today = date.toDateString();
	let time = date.toLocaleTimeString();
	document.getElementById("date-time").innerHTML = '<p id="date">' + today + '</p><p id="time">' + time + "</p>";
	setTimeout(dateTime, 1000);
}

function homepage() {
	dateTime();
}
