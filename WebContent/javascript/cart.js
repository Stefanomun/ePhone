
function add(id){
	console.log(id);
	var click = Number((document.getElementById("clicks")).innerHTML);
	var newClick = click + 1;
	document.getElementById("clicks").textContent = newClick;
}

function remove(id){
	var click = Number((document.getElementById("clicks")).innerHTML);
	var newClick = click - 1;
	document.getElementById("clicks").textContent = newClick;
}