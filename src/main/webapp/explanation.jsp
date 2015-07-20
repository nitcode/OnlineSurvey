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
                            <form  action="instructions.jsp" autocomplete="on" method="post"> 
                                <h1 style="font-family:Helvetica Neue">Explanation And Background Of This Study</h1> 
                                <P style="font-family:Helvetica Neue">Measures of the oxygen consumption (VO2) are used during basic assessments 
                                specifically for endurance capacity since many years. The most common practice 
                                is to conduct these tests as ramp or incremental step tests on a treadmill or a 
                                bicycle ergometer. Within these values the second ventilatory threshold (VT2) 
                                can be determined which is separating the aerobic-anaerobic from the predominantly 
                                anaerobic metabolism. For the interpretation of VO2max tests regarding the VT2, 
                                the preferred way in many clinics, universities or laboratories is to do an visual 
                                inspection based on given criteria. This method highly depends on the subjective 
                                rating of the researchers and might differ largely between different evaluators 
                                for the same data. For this reason there do exist many approaches to assess the 
                                VT2 automatically by the usage of different algorithms. However there’s no generally
                                 accepted method to compute spiroergometric data by solely one reliable algorithm. 
                                 The main explanation could be that there are too many special cases in which the 
                                 to date developed algorithms are unable to give proper results.</P> 
								<P style="font-family:Helvetica Neue">Therefore our first step was to develop an algorithm, which is capable to 
								compute the VT2 for the complicated cases, where most of the other algorithms 
								don’t work. Now the second step will be to collect as many expert opinions as 
								possible to generate a reliable mean opinion score for 20 selected data sets. 
								Hence we will optimize our algorithm and develop a further (intelligent) algorithm,
								 which chooses the ideal algorithm and its appropriate graph for every single data set.</P>
								<P style="font-family:Helvetica Neue">After its affirmation the final algorithm will be an advantage for every laboratory, 
								which uses spiroergometric tests, because the results of all data sets will be highly 
								comparable and independent of a subjective rating.</P>
								You were chosen as a potential expert to participate in our study to get the mean 
								opinion score for 20 selected data sets. 
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