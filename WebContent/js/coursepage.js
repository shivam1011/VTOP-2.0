$('#select-quiz-course').on('change', function() {
	var e = document.getElementById("select-quiz-course");
	var elem = e.options[e.selectedIndex].value;
	$( "#course-table" ).load( "http://localhost:8080/first/views/selectedcoursepage.jsp", { "course": elem } );
});