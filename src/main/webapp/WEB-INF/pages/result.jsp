<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<%@ page isELIgnored="false" %>
<title>Summary</title>
<meta name="viewport" content="width=device-width">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<script type="text/javascript" src="<c:url value="/resources/js/jquery-1.9.1.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/js/highcharts.js" />"></script>
<script src="http://code.highcharts.com/modules/data.js"></script>
<script type="text/javascript" src="<c:url value="/resources/js/exporting.js" />"></script>
<script src="<c:url value="/resources/js/vendorscript.js" />"></script>

<link rel="stylesheet" href="<c:url value="/resources/css/vendorstyle.css"/>" />
<link rel="stylesheet" href="<c:url value="/resources/css/table.css"/>" />
<link rel="stylesheet" href="<c:url value="/resources/css/style-5.css"/>" />

<link rel="stylesheet"  href="<c:url value="/resources/css/bootstrap.min.css"/>">
<link rel="stylesheet"  href="<c:url value="/resources/css/font-awesome.min.css"/>">
<link rel="stylesheet"  href="<c:url value="/resources/css/ionicons.min.css"/>">
<link rel="stylesheet"  href="<c:url value="/resources/css/AdminLTE.css"/>">

<script type="text/javascript" src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<script type="text/javascript" src="<c:url value="/resources/js/tableExport.js" />" ></script>
<script type="text/javascript" src="<c:url value="/resources/js/jquery.base64.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/js/html2canvas.js" />" ></script>
<script type="text/javascript" src="<c:url value="/resources/js/sprintf.js" />" ></script>
<script type="text/javascript" src="<c:url value="/resources/js/jspdf.js" />"  ></script>
<script type="text/javascript" src="<c:url value="/resources/js/base64.js" />" ></script>

<script type="text/javascript" src="<c:url value="/resources/js/jspdf.plugin.from_html.js" />" ></script>
<script type="text/javascript" src="<c:url value="/resources/js/jspdf.plugin.split_text_to_size.js" />" ></script>
<script type="text/javascript" src="<c:url value="/resources/js/jspdf.plugin.standard_fonts_metrics.js" />" ></script>
<script type="text/javascript" src="<c:url value="/resources/js/FileSaver.js" />" ></script>
<script type="text/javascript" src="<c:url value="/resources/js/BlobBuilder.js" />" ></script>

</head>
<body>
<header>
	<h1 style="margin:0 50px;font-size: 34px;text-shadow:4px 4px 4px #888;float:left; " style="font-family:Helvetica Neue">Expert Opinion For VT2 Determination</h1>
</header>

<section id="wrapper" >
	<div id="container_demo" >
		<div id="wrapper">
			<div id="login" class="animate form" style="width:542px;">
            	<form id="" action="last" autocomplete="on" method="post" modelAttribute="user"> 
            		<h1 style="font-family:Helvetica Neue">Summary</h1> 
                	<b style="font-family:Helvetica Neue">Title:</b> <%=request.getAttribute("tit")%><br/>
                    <b style="font-family:Helvetica Neue">Expert name:</b> <%=request.getAttribute("expertt") %><br/>
                	<b style="font-family:Helvetica Neue">Experience:</b> <%=request.getAttribute("experience")%><br/>
                	<b style="font-family:Helvetica Neue">Number Of Tests:</b> <%=request.getAttribute("test")%><br/>
                	<b style="font-family:Helvetica Neue">E-Mail:</b> <%=request.getAttribute("maill")%><br/><br/>
                	<p style="font-family:Helvetica Neue">In this table you can see your selected values. Please check if there are any mistakes and submit the results afterwards.
                	If you would like to download your results for comparing it to the mean data afterwards you can do this here</p>
                	<div class="btn-group">
							<button class="dropdown-toggle" data-toggle="dropdown">Export Data</button>
							<ul class="dropdown-menu " role="menu">
								
								<li><a href="#" onClick ="$('#customers').tableExport({type:'pdf',escape:'false'});"> <img src='<c:url value="/resources/images/pdf.png" />' width='14px'> PDF</a></li>
								<li><a href="#" onClick ="$('#customers').tableExport({type:'txt',escape:'false'});"> <img src='<c:url value="/resources/images/txt.png" />' width='14px'> TXT</a></li>
								<!--  <li><a href="#" onClick ="$('#customers').tableExport({type:'csv',escape:'false'});"> <img src='<c:url value="/resources/images/csv.png" />' width='14px'> CSV</a></li>
								<li><a href="#" onClick ="$('#customers').tableExport({type:'txt',escape:'false'});"> <img src='<c:url value="/resources/images/txt.png" />' width='14px'> TXT</a></li>
								<li class="divider"></li>				
								
								<li><a href="#" onClick ="$('#customers').tableExport({type:'excel',escape:'false'});"> <img src='<c:url value="/resources/images/xls.png" />' width='14px'> XLS</a></li>
								<li><a href="#" onClick ="$('#customers').tableExport({type:'doc',escape:'false'});"> <img src='<c:url value="/resources/images/word.png" />' width='14px'> Word</a></li>
								<li class="divider"></li>
								<li><a href="#" onClick ="$('#customers').tableExport({type:'png',escape:'false'});"> <img src='<c:url value="/resources/images/png.png" />' width='14px'> PNG</a></li>
								<li><a href="#" onClick ="$('#customers').tableExport({type:'pdf',escape:'false'});"> <img src='<c:url value="/resources/images/pdf.png" />' width='14px'> PDF</a></li>-->
								
								
							</ul>
						</div>	
                	<div style="overflow-y: scroll; height:200px;">
                	<table id="customers" class="zui-table zui-table-horizontal zui-table-highlight zui-table-rounded" width="100%">
    <thead>
    
    <tr style="display: none;">
		<th style="font-family:Helvetica Neue">Determination of the ventilatory threshold</th>
	</tr>

	<tr style="display: none;">
		<th style="font-family:Helvetica Neue">Universität Konstanz</th>
	</tr>

	<tr style="display: none;">
		<th style="font-family:Helvetica Neue">Sport and Computer Science Department</th>
	</tr>
	<tr style="display: none;">
		<th> </th>
	</tr>
	
	<tr style="display: none;">
		<th style="font-family:Helvetica Neue">Contact</th>
    	<th style="font-family:Helvetica Neue">patrick.thumm@uni-konstanz.de</th>
	</tr>
	
	<tr style="display: none;">
		<th style="font-family:Helvetica Neue">Expert name</th>
		<th style="font-family:Helvetica Neue"><%=request.getAttribute("expertt") %></th>
    </tr>
    
    <tr style="display: none;">
		<th> </th>
	</tr>
    
        <tr>
            <th style="font-family:Helvetica Neue">DataSet-Name</th>
            <th style="font-family:Helvetica Neue">Power</th>
            <th style="font-family:Helvetica Neue">VO2</th>
            <th style="font-family:Helvetica Neue">VCO2</th>
            <th style="font-family:Helvetica Neue">VE</th>
        </tr>
    </thead>
    <tbody>
    	<c:forEach var="i" items="${dataList}">
    		<tr> 
    		
    			        <td><a href="Previous?id=${i.key}&lastPage=0&valuePage=" class="info_link1">DataSet-${i.key}</a></td>
                        <c:forEach var="item" items="${i.value}" begin="0" end="0">
                        	<td style="font-family:Helvetica Neue"><c:out value="${item.last}" /></td>
                        	<td style="font-family:Helvetica Neue"><c:out value="${item.VO2}" /></td>
                        	<td style="font-family:Helvetica Neue"><c:out value="${item.VCO2}" /></td>
                        	<td style="font-family:Helvetica Neue"><c:out value="${item.VE}" /></td>
                        </c:forEach>
                
           </tr>
		</c:forEach>
		
    </tbody>
</table>
  </div><br/>
<p class="login button"> 
                        	<input type="submit" value="Submit"  /> 
						</p>
                </form>
			</div>
		</div>
	</div>
</section>
<footer>
	<span style="font-family:Helvetica Neue">&copy; 2014 <a href="http://www.uni-konstanz.de/"  style="font-family:Helvetica Neue">Universität Konstanz</a>.</span>
</footer>
</body>

</html>