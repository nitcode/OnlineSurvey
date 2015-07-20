<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Instructions For Expert</title>
<meta name="description" content="This is demonstration 1 for custom HTML5 video controls with jQuery and CSS by inWebson.com."/>
<meta name="keywords" content="html5, video, controls, custom, jquery, css, demo, demonstration"/>

<link rel="stylesheet" href="<c:url value="/resources/css/vendorstyle.css"/>" />
<link rel="stylesheet" href="<c:url value="/resources/css/style-5.css"/>" />

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<link rel="shortcut icon" href="<c:url value="/resources/images/Running.png" />" />

</head>
<body>
<header>
	<h1 style="font-family:Helvetica Neue">Expert Opinion For VT2 Determination</h1>
</header>
  <section id="wrapper">
	<div id="container_demo" >
		<div id="wrapper">
			<div id="login" class="animate form">
				  <form  action="expertRegister" autocomplete="on" method="post">
                	<h1 style="font-family:Helvetica Neue">Expert Information</h1> 
                		
                        <p>
                        	<label for="title" class="tname" data-icon="t" style="font-family:Helvetica Neue"> <b style="font-family:Helvetica Neue">Title, Degree and field of research*</b> <br/> (Prof, PhD, Bachelor, Master, etc. / performance diagnostics, endurance
research, etc.)</label>
                            <input id="title" name="title" required="required" type="text" placeholder="Prof or JuniorProf or PHD"/>
                        </p>
                        <p>
                        	<label for="experience1" class="ename1" data-icon="" style="font-family:Helvetica Neue"> <b style="font-family:Helvetica Neue">Experience*</b> <br/> (Are you doing VT determinations on a regular basis? When did you start in
this field?)</label>
                            <input id="experience1" name="experience1" required="required" type="text" placeholder="Are you doing VT determinations on a regular basis ?"/>
                        </p>
                        <p>
                        	<label for="experience" class="ename" data-icon="" style="font-family:Helvetica Neue"> <b style="font-family:Helvetica Neue">Total number of tests analyzed*</b> <br/> (Approximated value)</label>
                            <input id="experience" name="experience" required="required" type="text" placeholder="Approximate value"/>
                        </p>
                        <p>
                        	<label><b style="font-family:Helvetica Neue">Optional Information</b></label>
                        </p>
                        <p> 
                			<label for="username" class="uname" data-icon="u" style="font-family:Helvetica Neue" > Expert name* </label>
                            <input id="username" name="username"  type="text" placeholder="name"/>
                        </p>
                        <p>
                        	<label for="mail" class="mname" data-icon="e" style="font-family:Helvetica Neue"> Mail address (for further enquiries): </label>
                            <input id="mail" name="mail"  type="text" placeholder="mymail@mail.com" /> 
                        </p>
                        <p class="login button"> 
                        	<input type="submit" value="Start-Survey" /> 
						</p>
                  </form>
			</div>
		</div>
	</div>
</section>

<footer>
	<span style="font-family:Helvetica Neue">&copy; 2014 <a href="http://www.uni-konstanz.de/" style="font-family:Helvetica Neue">Universität Konstanz</a>.</span>
</footer>
</body>
</html>