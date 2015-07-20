<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6 lt8"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7 lt8"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8 lt8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
    <head>
        <meta charset="UTF-8" />
        <title>Determining Ventilatory Threshold Survey</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <meta name="description" content="Login and Registration Form with HTML5 and CSS3" />
        <meta name="keywords" content="html5, css3, form, switch, animation, :target, pseudo-class" />
        <meta name="author" content="Codrops" />
        <link rel="shortcut icon" href="../favicon.ico"> 
        <link rel="stylesheet" type="text/css" media="all" href="<c:url value="/resources/css/demo.css"/>">
        <link rel="stylesheet" type="text/css" media="all" href="<c:url value="/resources/css/style.css"/>">
		<link rel="stylesheet" type="text/css" media="all" href="<c:url value="/resources/css/animate-custom.css"/>">
    </head>
    <body>
        <div class="container">
            <header>
                <h1>Ventilatory Threshold Determination <br/>with <br/>Wasserman 9-Plot</h1>
			
            </header>
            <section>				
                <div id="container_demo" >
                    <a class="hiddenanchor" id="toregister"></a>
                    <a class="hiddenanchor" id="tologin"></a>
                    <div id="wrapper">
                        <div id="login" class="animate form">
                        					
                            <form  action="updatedgraphplot?id=1&value=" autocomplete="on" method="post"> 
                                <h1>User-Information</h1> 
                                <p> 
                                    <label for="Experience" class="uExperience"  > Are you working in a scientific or commercial institution ? </label>
                                    <input id="Experience" name="Experience" required="required" type="text" placeholder="Institution Name"/>
                                </p>
                                <p> 
                                    <label for="work" class="twork"  > Do you analyze Spiroergometries at least  once a week in the last year ? </label>
                                    <input id="work" name="work" required="required" type="text" placeholder="regarding work"/>
                                </p>
                                <p> 
                                    <label for="tests" class="etests"  > Number of tests analyzed ? </label>
                                    <input id="tests" name="tests" required="required" type="text" placeholder="number"/>
                                </p>
                                <p> 
                                    <label for="mail" class="mname" data-icon="e"> Your mail </label>
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
        </div>
    </body>
</html>