function login(){
    try{
        var usid = document.forms["loogin"]["usid"].value;
        if (usid == "") {
            alert("Name must be filled out");
            return false;
        }
        var re = /^[0-9]{2}[a-z]{3}[0-9]{4}$/;
        if(re.test(usid.toLowerCase()) == false){
        	alert("Invalid User ID pattern!");
        	return false;
        }
        /*
        var str=$('#loogin').serialize();
        $.ajax({
            url: "/first/login",
            type: "POST",
            data: str,
            dataType: "html",
            success: function (result) {
            	/*
            	var bc="false";
            	if (result.trim() == bc.trim()){
            		alert("Invalid Login Credentials!");
            		return false;
            	}
            	$("#loogin").submit();
            	return true;
            },
            error: function(XMLHttpRequest, textStatus, errorThrown) { 
                alert("Status: " + textStatus); alert("Error: " + errorThrown);
        }})
        */
        return true;
    }
    catch(e){alert(e)}
}
function faclogin(){
	try{
        var fcid = document.forms["facloogin"]["fcid"].value;
        if (fcid == "") {
            alert("Name must be filled out");
            return false;
        }
        var re = /^[0-9]{5}$/;
        if(re.test(fcid.toLowerCase()) == false){
        	alert("Invalid Faculty ID pattern!");
        	return false;
        }
    return true;
}
catch(e){alert(e)}
}