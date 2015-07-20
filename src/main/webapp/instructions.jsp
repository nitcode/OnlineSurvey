<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Instructions For Expert</title>
<meta name="description" content="This is demonstration 1 for custom HTML5 video controls with jQuery and CSS by inWebson.com."/>
<meta name="keywords" content="html5, video, controls, custom, jquery, css, demo, demonstration"/>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">

<link rel="stylesheet" href="<c:url value="/resources/css/vendorstyle.css"/>" />
<link rel="stylesheet" href="<c:url value="/resources/css/style-5.css"/>" />

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="<c:url value="/resources/js/vendorscript.js" />"></script>
<script src="<c:url value="/resources/js/video.js" />"></script>
<link rel="shortcut icon" href="<c:url value="/resources/images/Running.png" />" />
</head>

<body>
<!-- Header -->
<header>
	<h1 style="font-family:Helvetica Neue">Expert Opinion For VT2 Determination</h1>
</header>

<!-- Content -->
<section id="wrapper">

	
	
	<div id="container_demo" >
	<div id="wrapper">
			            <div id="login" class="animate form">
                            <form  action="expertinformation.jsp" autocomplete="on" method="post"> 
                                <h1 style="font-family:Helvetica Neue">Instructions</h1> 
                                <b style="font-family:Helvetica Neue">Step1:</b> Fill in the form about your personal information.<br/> <br/>
                                <b style="font-family:Helvetica Neue">Step2:</b> Determine the VT2 for the 20 data sets:<br/>
                                <p style="font-family:Helvetica Neue">Note*: During each of the tests the subjects were totally exhausted and finished the ramp within 8-12 mins.</p>
                                <p style="font-family:Helvetica Neue">A simple click on a point of a curve will move the VT2 to that point 
                                (attention: click on the curve, not away from it). Your selected values are posted 
                                above the graphs. The two arrows in the right upper corner allow to slightly move 
                                your selected value up or down for fine-tuning. With a double click on the graph 
                                it will enlarge for a closer view allowing a more precise selection if necessary. 
                                After selecting the VT2 value click on the next number at the top or the bottom of 
                                the page to proceed to the next data set. For a better analysis there is an option to 
                                use adjustable scale which you can activate by clicking on the scale sign. 
                                Please watch the video for more details. After finishing all graphs click “End survey” 
                                (scroll up to the top of the page) to get to the summary. Check your results (you may
                                  revise them) and click on “submit” afterwards.</p>
                                <b style="font-family:Helvetica Neue">Step3:</b> After submitting you can download your values as pdf<br/><br/>
                                <center><b style="font-family:Helvetica Neue">Demo Video</b></center> <br/> 
                                The video may best be viewed when enlarged (click on the cross at the bottom right). There is no sound.
                            
                            
                        						
<div class="videoContainer">
	
	<video id="myVideo" controls preload="auto" poster="<c:url value="/resources/images/VT1.png" />" width="500" height="350" >
		<source src="<c:url value="/resources/video/survey-3.webm" />" type="video/webm" >
		<source src="<c:url value="/resources/video/srvey.mp4" />" type="video/mp4" >
		<source src="<c:url value="/resources/video/survey.mov" />" type="video/mov" >
		
	  <p style="font-family:Helvetica Neue">Your browser does not support the video tag.</p>
	</video>
	<div class="caption" style="font-family:Helvetica Neue">How to select VT in graphs ?</div>
	<div class="control">

		<div class="topControl">
			<div class="progress">
				<span class="bufferBar"></span>
				<span class="timeBar"></span>
			</div>
			<div class="time">
				<span class="current"></span> / 
				<span class="duration"></span> 
			</div>
		</div>
		
		<div class="btmControl">
			<div class="btnPlay btn" title="Play/Pause video"></div>
			<div class="btnStop btn" title="Stop video"></div>
			<div class="spdText btn">Speed: </div>
			<div class="btnx1 btn text selected" title="Normal speed">x1</div>
			<div class="btnx3 btn text" title="Fast forward x3">x3</div>
			<div class="btnFS btn" title="Switch to full screen"></div>
			<div class="btnLight lighton btn" title="Turn on/off light"></div>
			<div class="volume" title="Set volume">
				<span class="volumeBar"></span>
			</div>
			<div class="sound sound2 btn" title="Mute/Unmute sound"></div> 
		</div>
		
	</div>
	<div class="loading"></div>
</div>

<p class="login button" style="font-family:Helvetica Neue"> 
                        	<input type="submit" value="Next" /> 
						</p>
</form>
</div>
</div>
		</div>

	
	
</section>

		
<!-- Footer -->
<footer>
	<span style="font-family:Helvetica Neue">&copy; 2014 <a href="http://www.uni-konstanz.de/" style="font-family:Helvetica Neue">Universität Konstanz</a>.</span>
</footer>
</body>
</html>