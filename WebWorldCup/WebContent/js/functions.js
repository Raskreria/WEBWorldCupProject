

function getParameter(name){
	let value = undefined;
	
	let parameters = location.search;
	parameters= parameters.substr(1);
	
	parameters= parameters.split("&");
	
	for(let i = 0 ; i <parameters.length; i++){
		let parameter = parameters[i].split("=");
		
		let paramName = parameter[0];
		let paramValue = parameter[1];
		
		if(paramName == name){
			value = paramValue;
			break;
		}
	}
	return value;
}
function changeCategoryKtoE(category){
	
	if(category == "스마트폰"){
		category = "smartphone";
	}else if(category == "노트북"){
		category = "notebook";
	}else if(category == "태블릿"){
		category = "tablet";
	}
	
	return category;
}