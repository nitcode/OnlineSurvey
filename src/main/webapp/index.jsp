<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Welcome</title>
<meta name="description" content="This is demonstration 1 for custom HTML5 video controls with jQuery and CSS by inWebson.com."/>
<meta name="keywords" content="html5, video, controls, custom, jquery, css, demo, demonstration"/>

<link rel="stylesheet" href="<c:url value="/resources/css/vendorstyle.css"/>" />
<link rel="stylesheet" href="<c:url value="/resources/css/style-5.css"/>" />

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>

<link rel="shortcut icon" href="<c:url value="/resources/images/Running.png" />" />

<script type="text/javascript">

$(document).ready(function(){
	//open popup
	$("#pop").click(function(){
		
			$("#overlay_form").fadeIn(1000);
			  positionPopup();
		
	  
	});
	
	$("#log").click(function(){
		if($('#password').val()=='')
	    	{
	    	alert('Enter Password');
	    	//$('#element_to_pop_up').bPopup();
	    	}
		else if($('#password').val()=='vt@2'){
			$("#overlay_form").fadeOut(200);
			window.location.href="explanation.jsp";	
		}
		else
			{
			alert('Wrong Password');
			$('#password').val('');
			}
		

	});
	

	//close popup
	$("#close").click(function(){
	$("#overlay_form").fadeOut(500);
	});
	});
	 
	//position the popup at the center of the page
	function positionPopup(){
	if(!$("#overlay_form").is(':visible')){
	return;
	}
	$("#overlay_form").css({
	left: ($(window).width() - $('#overlay_form').width()) / 2,
	top: ($(window).width() - $('#overlay_form').width()) / 7,
	position:'absolute'
	});
	}
	 
	//maintain the popup at center of the page when browser resized
	$(window).bind('resize',positionPopup);

	//position the popup at the center of the page
	

</script>
<style>
#overlay_form{
position: floating;
border: 5px solid gray;
padding: 10px;
background: white;
width: 270px;
height: 100px;
}
#pop{
display: block;
border: 1px solid gray;
width: 45px;
text-align: center;
padding: 6px;
border-radius: 5px;
text-decoration: none;
margin: 0 auto;
}
</style>

</head>

<body>

<header>
	<h1 style="font-family:Helvetica Neue">Expert Opinion For VT2 Determination</h1>
</header>

<section id="wrapper">

	
	
	<div id="container_demo" >
	<div id="wrapper">
			            <div id="login" class="animate form" style="font-family:Helvetica Neue">
                            <!--  <form  action="explanation.jsp" autocomplete="on" method="post"> -->
                                <h1 style="font-family:Helvetica Neue">Welcome to our study</h1> 
                                <P style="font-family:Helvetica Neue">The goal of this investigation is to develop an intelligent algorithm, 
                                which will compute objective VT2 values for every given data set 
                                (consisting of power, time, VO2, VCO2, VE and HR values), using a huge variety 
                                of different algorithms. Therefore we are collecting a mean opinion score 
                                for 20 data sets from experts in exercise physiology.</P> 
								<P style="font-family:Helvetica Neue">The inquiry of the determinations can be completely anonymous. We only need 
								the knowledge about your scientific background and your experience in the field 
								of spiroergometries.</P>
								<P style="font-family:Helvetica Neue">The deadline for submitting your survey results is the 31st of March.</P>
								<p class="login button" > 
                        	<input type="submit" value="Next"  id="pop" /> 
						</p>
                            
                        	<!--  </form>-->
						</div>
	</div>
	</div>
</section>
<form id="overlay_form" style="display:none">
<h2 style="font-family:Helvetica Neue">Enter Password :</h2><input type="password" name="password"  id="password"/><br/>
<input type="button" value="Login" id="log" />
<a href="#" id="close" >Close</a>
</form>
<footer>
	<span style="font-family:Helvetica Neue">&copy; 2014 <a style="font-family:Helvetica Neue" href="http://www.uni-konstanz.de/">Universität Konstanz</a>.</span>
</footer>
</body>
</html>