$('#select-quiz-course').on('change', function() {
	var e = document.getElementById("select-quiz-course");
	var elem = e.options[e.selectedIndex].value;
	$.ajax({
        url: "/first/quizlink",
        type: "GET",
        data: {data:elem},
        dataType: "html",
        success: function (result) {
        	result = result.trim();
        	if(result=="N/A"){
        		quiz_not_available(elem);
        		//alert("Not available");
        	}
        	else{
        		quiz_available(elem, result);
        		//alert("Available");
        	}
        },
        error: function(XMLHttpRequest, textStatus, errorThrown) { 
            alert("Status: " + textStatus); alert("Error: " + errorThrown);
    }})
});	

function quiz_not_available(elem){
	/*$('#quiz-link-div').empty();
	var noquiz = document.createElement('h4');
	noquiz.innerHTML = "No Quiz Available: "+elem;
	document.getElementById("quiz-link-div").appendChild(noquiz);*/
	document.getElementById("quiz-avail").style.display = "none";
	document.getElementById("quiz-not-avail").style.display = "block";
}

function quiz_available(elem, link){
	/*
	$("#quiz-link-div").load("http://localhost:8080/first/html/quiz-link-div.html").promise().then(
			function(){
		//var link = "https://www.facebook.com";
		var a = document.getElementById('quiz-start-link');
		a.href = link;
		var quizname = document.getElementById("quiz-name");
		quizname.innerHTML = "Quiz Available: "+elem;
	});
	*/
	document.getElementById("quiz-avail").style.display = "block";
	document.getElementById("quiz-not-avail").style.display = "none";
	var quizbtn = document.getElementById('quiz-start-button');
	$('#quiz-start-button').empty();
	var a = document.createElement('a');
	var linkText = document.createTextNode("Start!");
	a.appendChild(linkText);
	a.title = "Alles Gute!";
	a.href = link;
	quizbtn.appendChild(a);
	var quizname = document.getElementById("quiz-name");
	quizname.innerHTML = "Quiz Available: "+elem;
}

function clear_div(){
	$('#quiz-link-div').empty();
}