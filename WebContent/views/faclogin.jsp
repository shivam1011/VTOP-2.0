<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>VTOP 2.0</title>
    <link rel="stylesheet" type="text/css" href="http://localhost:8080/first/css/styles.css"/>
</head>
<body>
    <div class="container-menu">
        <ul class="menu">
            <li style="margin-left:5%"><img src="http://localhost:8080/first/images/logo.png" alt="VIT Logo"/></li>
            <li style="font-size: 24px; float: right; margin-right: 0.5%;"><a>VTOP-Beta 2.0</a></li>
        </ul>
    </div>
    
    <div class="login" align="center">
        <h3>VTOP Faculty Login</h3><hr/><br/>
        <form id="facloogin" method="post" action="http://localhost:8080/first/faclogin">
            <input type="text" name="fcid" id="fcid" placeholder="Username" /> <br /><br />
            <input type="password" id="pswd" name="pswd" placeholder="Password" /> <br /><br />
            <img src="http://localhost:8080/first/images/capcha.png" /> <br /><br />
            <input style="width:50%" type="text" id="cap" placeholder="Captcha (CAPS & NUMBERS ONLY)"/> <br />
            <br/><hr/><br/>
            <a href="" style="text-decoration:none;color:#3C8DBC;">Reset/Forget password</a>
            &nbsp <a href="http://localhost:8080/first/views/login.jsp" style="text-decoration:none;color:#3C8DBC;">Student Login</a>
            <br><button type="submit" onclick="return faclogin();">Sign in</button>
        </form>

    </div>
    <div class="footer">
        <div class="footer">
            <span class="footer-left">Copyright &copy; 2018 <a href="https://www.vit.ac.in" target="_blank">VIT</a></span>
            <span class="footer-right">Bajaj_DK (15BCE0553)</span>
        </div>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="http://localhost:8080/first/js/scripts.js" type="text/javascript"></script>
    <script type="text/javascript">
    var Msg ='<%=request.getSession().getAttribute("error")%>';
	//alert(Msg)
    if (Msg != "null") {
		alert("Unauthorized access!");
	}
	else{
		//alert("Fresh.. ek dum kadak");
	}
    </script>
</body>
</html>