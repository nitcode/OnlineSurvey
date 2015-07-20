<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
  <head>
  <%@ page isELIgnored="false" %>
    <title>
      Chart
    </title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    
  </head>
  <body>
  
  
  <c:forEach items="${graphVO2}" var="user">
					<div class="result">
  ${user.VE}
</div>
<div class="result1">
  ${user.last}
</div>
					
				</c:forEach>
  
  		
  </body>
</html>