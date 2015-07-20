<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
  <head>
  <%@ page isELIgnored="false" %>
    <title>
      Wasserman 9-Plot
    </title>
    <meta name="viewport" content="width=device-width">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script type="text/javascript" src="<c:url value="/resources/js/jquery-1.9.1.js" />"></script>
    <script type="text/javascript" src="<c:url value="/resources/js/highcharts.js" />"></script>
    <script type="text/javascript" src="<c:url value="/resources/js/exporting.js" />"></script>
    
    <script type="text/javascript" src="<c:url value="/resources/js/highslide-full.min.js" />"></script>
    <script type="text/javascript" src="<c:url value="/resources/js/highslide.config.js" />"></script>
    <link rel="stylesheet"  href="<c:url value="/resources/css/highslide.css"/>">
    
   	<script src="https://rawgithub.com/highslide-software/draggable-points/master/draggable-points.js"></script>
    
	<script src="<c:url value="/resources/js/vendorscript.js" />"></script>
	
	<link rel="stylesheet"  href="<c:url value="/resources/css/style4.css"/>">
	<link rel="stylesheet" href="<c:url value="/resources/css/vendorstyle.css"/>" />
	<link rel="shortcut icon" href="<c:url value="/resources/images/Running.png" />" />
   	
<script type="text/javascript">
$(function () {
	var arr = [];
    var graph1 = [];
    var graph2 = [];
    var graph3 = [];
    var graph4 = [];
    var graph5 = [];
    var graph6 = [];
    var graph7 = [];
    var graph8 = [];
    var graph9 = [];
    var graph10 = [];
    var graph11 = [];
    var graph12 = [];
    var graph13 = [];
    
    <c:forEach items="${oldGraphValues}" var="item">{
    	arr.push([${item.last}, ${item.VE}]);
        graph1.push([${item.last},${item.HR}]);
        graph2.push([${item.last}, (${item.VO2_KG}/${item.HR})*100]);
        graph3.push([${item.last}, ${item.VO2}]);
        graph4.push([${item.last}, ${item.VCO2}]);
        graph5.push([${item.VCO2}, ${item.VE}]);
        graph6.push([${item.VO2}, ${item.HR}]);
        graph7.push([${item.VO2}, ${item.VCO2}]);
        graph8.push([${item.last}, ${item.VE}/${item.VO2}]);
        graph9.push([${item.last}, ${item.VE}/${item.VCO2}]);
        graph10.push([${item.last}, ${item.RER}]);
        graph11.push([${item.last}, ${item.PET_O2}]);
        graph12.push([${item.last}, ${item.PET_CO2}]);
        graph13.push([${item.VE}, ${item.VT}]);
    }
    </c:forEach> 
    
    /*Old Graph Data*/
    
    var data1 = [];
    var data2 = [];
    var data3 = [];
    var data4 = [];
    
    <c:forEach items="${thresholdValues}" var="item">{
    	data1.push([${item.last}]);
    	data2.push([${item.VE}]);
    	data3.push([${item.VO2}]);
    	data4.push([${item.VCO2}]);
    }
    </c:forEach> 
    
    $('#vo2').val(data3[0]);
    $('#vco2').val(data4[0]);
    $('#ve').val(data2[0]);
    $('#power').val(data1[0]);
    
    /*Chart-1*/
    createGraph({
    	credits: {
    		enabled: false
    	},
    	tooltip: {
    		crosshairs: true
    	},
    	chart: {
    		renderTo: 'container0',
            type: 'scatter',
            events: {}
    	},
    	title: {
    		text: '1'
    	},
    	xAxis: {
    		title: {
    			enabled: true,
                text: 'Power (watt)'
    		},
    		min:0,
    		plotLines: [{
    			id: 'vi',
                color: 'green',
                width: 2,
                value:data1[0] 
    		}],
    		startOnTick: true,
            endOnTick: true,
            showLastLabel: true
    	},
    	yAxis: {
    		title: {
    			text: 'VE (L/min)'
    		}
    	},
    	legend: {
    		layout: 'vertical',
            align: 'left',
            verticalAlign: 'top',
            x: 100,
            y: 40,
            floating: true,
            backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF',
            borderWidth: 1
    	},
    	tooltip: {
    		crosshairs: true,
    		formatter: function() {
    			if(this.series.name == 'VE'){
    				
    				return '<b>'+ this.series.name +'</b><br/>'+
    				this.point.x+ ' watt,'+ this.point.y+' L/min';
    				}
    			else
    				{
    				return false ;
    				}
    		}
		},
    	plotOptions: {
    		scatter: {
    			marker: {
    				radius: 3,
    				states: {
    					hover: {
    						enabled: true,
    						lineColor: 'rgb(100,100,100)'
    					}
    				}
    			},
    			states: {
    				hover: {
    					marker: {
    						enabled: false
    					}
    				}
    			},
    			
    		},
    		series: {
    			point:{
                	events:{
                		click:function(){
                			var chart= this.series.chart.xAxis[0];
                			chart.removePlotLine('vi');
                            chart.addPlotLine({
                            	value:this.x,
                               	color:'green',
                               	width:2,
                               	id:'vi'
                            });
                            $('#hiddenValue').val(this.x);
                            $('#power').val(this.x);
                            $('#ve').val(this.y);
                               			
                            var chart = $("#container0").highcharts();
                            chart.xAxis[0].removePlotLine('vi');
                            chart.xAxis[0].addPlotLine({
                           		value: this.x,
                           	    width: 2,
                           	    color: 'green',
                           	    id: 'vi'
                           	});
                           	
                           	var chart = $("#container2").highcharts();
                           	chart.xAxis[0].removePlotLine('vi');
                           	chart.xAxis[0].addPlotLine({
                           		value: this.x,
                           	    width: 2,
                           	    color: 'green',
                           	    id: 'vi'
                           	});
                           	
                           	var chart = $("#container3").highcharts();
                           	chart.xAxis[0].removePlotLine('vi');
                           	chart.xAxis[0].addPlotLine({
                           		value: this.x,
                           	    width: 2,
                           	    color: 'green',
                           	    id: 'vi'
                           	});
                           	
                           	var chart = $("#container6").highcharts();
                           	chart.xAxis[0].removePlotLine('vi');
                           	chart.xAxis[0].addPlotLine({
                           		value: this.x,
                           	    width: 2,
                           	    color: 'green',
                           	    id: 'vi'
                           	});
                           	
                           	var chart = $("#container8").highcharts();
                           	chart.xAxis[0].removePlotLine('vi');
                           	chart.xAxis[0].addPlotLine({
                           		value: this.x,
                           	    width: 2,
                           	    color: 'green',
                           	    id: 'vi'
                           	});
                           	
                           	var chart = $("#container9").highcharts();
                           	chart.xAxis[0].removePlotLine('vi');
                           	chart.xAxis[0].addPlotLine({
                           		value: this.x,
                           	    width: 2,
                           	    color: 'green',
                           	    id: 'vi'
                           	});
                           	
                           	$.ajax({
                           		url : 'graphplotTime?id='+this.x+'&tableId='+$('#hiddenValue1').val(),
               					success : function(data) {
               						var response=$('<html />').html(data);
               					    var anch=[];
               					    response.find('div.result').each(function(){
               					    	anch.push($(this).text());
               					    });
               					    
               					    $('#vco2').val(anch[0]);
               					    var chart = $("#container4").highcharts();
               					 	chart.xAxis[0].removePlotLine('vi');
               	                	chart.xAxis[0].addPlotLine({
               	                		value: anch[0],
               	                	    width: 2,
               	                	    color: 'green',
               	                	    id: 'vi'
               	                	});
               	                	
               	                	var anch1=[];
               					    response.find('div.result1').each(function(){
               					    	anch1.push($(this).text());
               					    });
               					    
               					    $('#vo2').val(anch1[0]);
               					    var chart = $("#container5").highcharts();
               					 	chart.xAxis[0].removePlotLine('vi');
               	                	chart.xAxis[0].addPlotLine({
               	                		value: anch1[0],
               	                	    width: 2,
               	                	    color: 'green',
               	                	    id: 'vi'
               	                	});
               	                	
               	                	var anch2=[];
               					    response.find('div.result2').each(function(){
               					    	anch2.push($(this).text());
               					    });
               					    
               					    var chart = $("#container7").highcharts();
               					 	chart.xAxis[0].removePlotLine('vi');
               	                	chart.xAxis[0].addPlotLine({
               	                		value: anch2[0],
               	                	    width: 2,
               	                	    color: 'green',
               	                	    id: 'vi'
               	                	});
               					},
               					error: function(){	
               						alert('Error while request..');
               					}
                           	});
                		}
                	}
                }
    		}
    	},
    	series: [{
    		name: 'VE',
            color: 'rgba(223, 83, 83, .5)',
            data: arr
    	},
    	{
     		name: 'VE-2',
     		lineWidth: 2,
            marker: {  radius: 3 },
     		showInLegend: false, 
     		draggableX: true,
     		type: 'line',
             draggableY: true,
             color: 'rgba(0, 0, 0, .5)',
             data: [arr[0],arr[Math.floor(arr.length / 2)],arr[arr.length -5]],
             visible: false,
             point:{
               	events:{
               		click:function(){
               			var chart = $('#container0').highcharts(),
                 		series = chart.series[1];
               			var chart1 = $("#container0").highcharts();
                        chart1.series[1].setData([arr[0],[this.x,this.y],arr[arr.length -5]],true);
               		}
               	}
              }
     	}],
    	navigation: {
    		buttonOptions: {
    			enabled: false
    		}
    	} ,
    	lang: {
            some_key: 'Polyline',
            right: 'Right',
            left: 'Left'
        },
    	exporting: {
    		buttons: {
    			'angle':{
    				enabled:true,
    				x:-62,
    				symbol: 'url(<c:url value="/resources/images/sclae-2.png" />)',
    				_titleKey: 'some_key',
    				onclick:function(chart){
    					var plotline = this.xAxis[0].plotLinesAndBands[0];
    					if(typeof plotline.options.value=='undefined')
    						{
    						alert('select threshold point to active scale');
    						}
    					else
    						{
    						var chart = $('#container0').highcharts(),
        		            series = chart.series[1];
        					if(this.series[1].visible){
        						this.series[1].hide();
        						series.hide();
        					}
        					else{
        						this.series[1].show();
        						series.show();
        					}
    						}
    					
    				},
    			},
    			'myButton': {
    				enabled:true,
    				x: -32,
    				_titleKey: 'right',
    				onclick: function (chart) {
    					var chart= this.xAxis[0].plotLinesAndBands[0];
    					var a=chart.options.value
                        this.xAxis[0].removePlotLine('vi');
                        this.xAxis[0].addPlotLine({
                        	value:+a + 1,
                           	color:'green',
                           	width:2,
                           	id:'vi'
                        });
                        
                        var chart = $('#container0').highcharts();
                        chart.xAxis[0].removePlotLine('vi');
                        chart.xAxis[0].addPlotLine({
                        	value:+a + 1,
                           	color:'green',
                           	width:2,
                           	id:'vi'
                        });
                        
                        var chart = $("#container2").highcharts();
                       	chart.xAxis[0].removePlotLine('vi');
                       	chart.xAxis[0].addPlotLine({
                       		value: +a + 1,
                       	    width: 2,
                       	    color: 'green',
                       	    id: 'vi'
                       	});
                       	
                       	var chart = $("#container3").highcharts();
                       	chart.xAxis[0].removePlotLine('vi');
                       	chart.xAxis[0].addPlotLine({
                       		value: +a + 1,
                       	    width: 2,
                       	    color: 'green',
                       	    id: 'vi'
                       	});
                       	
                       	var chart = $("#container6").highcharts();
                       	chart.xAxis[0].removePlotLine('vi');
                       	chart.xAxis[0].addPlotLine({
                       		value: +a + 1,
                       	    width: 2,
                       	    color: 'green',
                       	    id: 'vi'
                       	});
                       	
                       	var chart = $("#container8").highcharts();
                       	chart.xAxis[0].removePlotLine('vi');
                       	chart.xAxis[0].addPlotLine({
                       		value: +a + 1,
                       	    width: 2,
                       	    color: 'green',
                       	    id: 'vi'
                       	});
                       	
                       	var chart = $("#container9").highcharts();
                       	chart.xAxis[0].removePlotLine('vi');
                       	chart.xAxis[0].addPlotLine({
                       		value: +a + 1,
                       	    width: 2,
                       	    color: 'green',
                       	    id: 'vi'
                       	});
                        
                        $('#power').val(a);
                        $.ajax({
                        	url : 'graphplotTime?id='+(+a + 1)+'&tableId='+$('#hiddenValue1').val(),
           					success : function(data) {
           						var response=$('<html />').html(data);
           					    var anch=[];
           					    response.find('div.result').each(function(){
           					    	anch.push($(this).text());
           					    });
           					    
           					    $('#vco2').val(anch[0]);
           					    var chart = $("#container4").highcharts();
           	                	chart.xAxis[0].removePlotLine('vi');
           	                	chart.xAxis[0].addPlotLine({
           	                		value: anch[0],
           	                	    width: 2,
           	                	    color: 'green',
           	                	    id: 'vi'
           	                	});
           	                	
           	                	var anch1=[];
           					    response.find('div.result1').each(function(){
           					    	anch1.push($(this).text());
           					    });
           					    
           					    $('#vo2').val(anch1[0]);
           					    var chart = $("#container5").highcharts();
           	                	chart.xAxis[0].removePlotLine('vi');
           	                	chart.xAxis[0].addPlotLine({
           	                		value: anch1[0],
           	                	    width: 2,
           	                	    color: 'green',
           	                	    id: 'vi'
           	                	});
           	                	
           	                	var anch2=[];
           					    response.find('div.result2').each(function(){
           					    	anch2.push($(this).text());
           					    });
           					    
           					 $('#ve').val(anch2[0]);
           					    var chart = $("#container7").highcharts();
           	                	chart.xAxis[0].removePlotLine('vi');
           	                	chart.xAxis[0].addPlotLine({
           	                		value: anch2[0],
           	                	    width: 2,
           	                	    color: 'green',
           	                	    id: 'vi'
           	                	});
           					},
           					error: function(){
           						alert('Error while request..');
           					}
                        });
    				},
    				symbol: 'url(<c:url value="/resources/images/right.png" />)'
    			},
    			'myButton1':{
    				enabled:true,
                    x: -2,
                    _titleKey: 'left',
                    onclick: function (chart) {
    					var chart= this.xAxis[0].plotLinesAndBands[0];
    					var a=chart.options.value
                        this.xAxis[0].removePlotLine('vi');
                        this.xAxis[0].addPlotLine({
                        	value:a-1,
                           	color:'green',
                           	width:2,
                           	id:'vi'
                        });
                        
                        var chart = $('#container0').highcharts();
                        chart.xAxis[0].removePlotLine('vi');
                        chart.xAxis[0].addPlotLine({
                        	value:a-1,
                           	color:'green',
                           	width:2,
                           	id:'vi'
                        });
                        
                        var chart = $("#container2").highcharts();
                       	chart.xAxis[0].removePlotLine('vi');
                       	chart.xAxis[0].addPlotLine({
                       		value: a-1,
                       	    width: 2,
                       	    color: 'green',
                       	    id: 'vi'
                       	});
                       	
                       	var chart = $("#container3").highcharts();
                       	chart.xAxis[0].removePlotLine('vi');
                       	chart.xAxis[0].addPlotLine({
                       		value: a-1,
                       	    width: 2,
                       	    color: 'green',
                       	    id: 'vi'
                       	});
                       	
                       	var chart = $("#container6").highcharts();
                       	chart.xAxis[0].removePlotLine('vi');
                       	chart.xAxis[0].addPlotLine({
                       		value: a-1,
                       	    width: 2,
                       	    color: 'green',
                       	    id: 'vi'
                       	});
                       	
                       	var chart = $("#container8").highcharts();
                       	chart.xAxis[0].removePlotLine('vi');
                       	chart.xAxis[0].addPlotLine({
                       		value: a-1,
                       	    width: 2,
                       	    color: 'green',
                       	    id: 'vi'
                       	});
                       	
                       	var chart = $("#container9").highcharts();
                       	chart.xAxis[0].removePlotLine('vi');
                       	chart.xAxis[0].addPlotLine({
                       		value: a-1,
                       	    width: 2,
                       	    color: 'green',
                       	    id: 'vi'
                       	});
                        
                        $('#power').val(a);
                        $.ajax({
                        	url : 'graphplotTime?id='+(+a + 1)+'&tableId='+$('#hiddenValue1').val(),
           					success : function(data) {
           						var response=$('<html />').html(data);
           					    var anch=[];
           					    response.find('div.result').each(function(){
           					    	anch.push($(this).text());
           					    });
           					    
           					    $('#vco2').val(anch[0]);
           					    var chart = $("#container4").highcharts();
           	                	chart.xAxis[0].removePlotLine('vi');
           	                	chart.xAxis[0].addPlotLine({
           	                		value: anch[0],
           	                	    width: 2,
           	                	    color: 'green',
           	                	    id: 'vi'
           	                	});
           	                	
           	                	var anch1=[];
           					    response.find('div.result1').each(function(){
           					    	anch1.push($(this).text());
           					    });
           					    
           					    $('#vo2').val(anch1[0]);
           					    var chart = $("#container5").highcharts();
           	                	chart.xAxis[0].removePlotLine('vi');
           	                	chart.xAxis[0].addPlotLine({
           	                		value: anch1[0],
           	                	    width: 2,
           	                	    color: 'green',
           	                	    id: 'vi'
           	                	});
           	                	
           	                	var anch2=[];
           					    response.find('div.result2').each(function(){
           					    	anch2.push($(this).text());
           					    });
           					    
           					 $('#ve').val(anch2[0]);
           					    var chart = $("#container7").highcharts();
           	                	chart.xAxis[0].removePlotLine('vi');
           	                	chart.xAxis[0].addPlotLine({
           	                		value: anch2[0],
           	                	    width: 2,
           	                	    color: 'green',
           	                	    id: 'vi'
           	                	});
           					},
           					error: function(){
           						alert('Error while request..');
           					}
                        });
    				},
                    symbol:'url(<c:url value="/resources/images/left.png" />)',
    			}
    		}
    	}
    });
                
                /*Chart-2*/
                
                createGraph({
                	
                	credits: {
       			      enabled: false
       			  },
           		
           		tooltip: {
                       crosshairs: true
                   },
                     chart: {
                         renderTo: 'container2',
                         type: 'scatter',
                         events: {}
                     },
                     title: {
                     	text: '2'
                     },
                     xAxis: {
                     	
                         title: {
                             enabled: true,
                             text: 'Power (watt)'
                         },
                         min:0,
                         plotLines: [{
                 			id: 'vi',
                             color: 'green',
                             width: 2,
                             value:data1[0] 
                 		}],
                         startOnTick: true,
                         endOnTick: true,
                         showLastLabel: true
                     },
                     
                     yAxis: [{
                         title: {
                             text: 'VO2/HR (ml/beat)'
                         },
                         opposite: true,
                         min:0,
                         tickInterval: 10
                     },
                     {
                     	title: {
                     		text: 'HR (min)'
                     	},
                     	min:0,
                         tickInterval: 30
                     	
                     }],
                     
                     legend: {
                         layout: 'vertical',
                         align: 'left',
                         verticalAlign: 'top',
                         x: 100,
                         y: 40,
                         floating: true,
                         backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF',
                         borderWidth: 1
                     },
                     tooltip: {
                    	 crosshairs: true,
                 		formatter: function() {
                 			if(this.series.name == 'VE-2'){
                 				return false;	
                 			}
                 			else if(this.series.name == 'HR')
                 				{
                 				return '<b>'+ this.series.name +'</b><br/>'+
                				this.point.x+ ' watt,'+ this.point.y+' beat';
                 				
                 				}
                 			else if (this.series.name == 'HR/VO2'){
                 				return '<b>'+ this.series.name +'</b><br/>'+
                				this.point.x+ ' watt,'+ this.point.y.toFixed(2)+' ml/beat';
                 			}
                 		}
             		},
                     plotOptions: {
                         scatter: {
                             marker: {
                             	radius: 3,
                                 states: {
                                     hover: {
                                         enabled: true,
                                         lineColor: 'rgb(100,100,100)'
                                     }
                                 }
                             },
                             states: {
                                 hover: {
                                     marker: {
                                         enabled: false
                                     }
                                 }
                             },
                             
                            
                         },
                         series: {
                        	 point:{
                              	events:{
                              		click:function(){
                              			var chart= this.series.chart.xAxis[0];
                                         chart.removePlotLine('vi');
                                         chart.addPlotLine({
                                         	value:this.x,
                                            	color:'green',
                                            	width:2,
                                            	id: 'vi'
                                         });
                                         $('#hiddenValue').val(this.x);
                                         $('#power').val(this.x);
                                         
                                         var chart = $("#container2").highcharts();
                                        	chart.xAxis[0].removePlotLine('vi');
                                        	chart.xAxis[0].addPlotLine({
                                        		value: this.x,
                                        	    width: 2,
                                        	    color: 'green',
                                        	    id: 'vi'
                                        	});
                                         
                                         var chart = $("#container0").highcharts();
                                        	chart.xAxis[0].removePlotLine('vi');
                                        	chart.xAxis[0].addPlotLine({
                                        		value: this.x,
                                        	    width: 2,
                                        	    color: 'green',
                                        	    id: 'vi'
                                        	});
                                        	
                                        	var chart = $("#container3").highcharts();
                                     	chart.xAxis[0].removePlotLine('vi');
                                     	chart.xAxis[0].addPlotLine({
                                     		value: this.x,
                                     	    width: 2,
                                     	    color: 'green',
                                     	    id: 'vi'
                                     	});
                                     	
                                     	var chart = $("#container6").highcharts();
                                     	chart.xAxis[0].removePlotLine('vi');
                                     	chart.xAxis[0].addPlotLine({
                                     		value: this.x,
                                     	    width: 2,
                                     	    color: 'green',
                                     	    id: 'vi'
                                     	});
                                     	
                                     	var chart = $("#container8").highcharts();
                                     	chart.xAxis[0].removePlotLine('vi');
                                     	chart.xAxis[0].addPlotLine({
                                     		value: this.x,
                                     	    width: 2,
                                     	    color: 'green',
                                     	    id: 'vi'
                                     	});
                                     	
                                     	var chart = $("#container9").highcharts();
                                     	chart.xAxis[0].removePlotLine('vi');
                                     	chart.xAxis[0].addPlotLine({
                                     		value: this.x,
                                     	    width: 2,
                                     	    color: 'green',
                                     	    id: 'vi'
                                     	});
                                     	
                                     	$.ajax({
                                     		url : 'graphplotTime?id='+this.x+'&tableId='+$('#hiddenValue1').val(),
                         					success : function(data) {
                         						var response=$('<html />').html(data);
                         					    var anch=[];
                         					    response.find('div.result').each(function(){
                         					    	anch.push($(this).text());
                         					    });
                         					    
                         					    $('#vco2').val(anch[0]);
                         					    var chart = $("#container4").highcharts();
                         	                	chart.xAxis[0].removePlotLine('vi');
                         	                	chart.xAxis[0].addPlotLine({
                         	                		value: anch[0],
                         	                	    width: 2,
                         	                	    color: 'green',
                         	                	    id: 'vi'
                         	                	});
                         	                	
                         	                	var anch1=[];
                         					    response.find('div.result1').each(function(){
                         					    	anch1.push($(this).text());
                         					    });
                         					    
                         					    $('#vo2').val(anch1[0]);
                         					    var chart = $("#container5").highcharts();
                         	                	chart.xAxis[0].removePlotLine('vi');
                         	                	chart.xAxis[0].addPlotLine({
                         	                		value: anch1[0],
                         	                	    width: 2,
                         	                	    color: 'green',
                         	                	    id: 'vi'
                         	                	});
                         	                	
                         	                	var anch2=[];
                         					    response.find('div.result2').each(function(){
                         					    	anch2.push($(this).text());
                         					    });
                         					    
                         					    $('#ve').val(anch2[0]);
                                     			var chart = $("#container7").highcharts();
                         	                	chart.xAxis[0].removePlotLine('vi');
                         	                	chart.xAxis[0].addPlotLine({
                         	                		value: anch2[0],
                         	                	    width: 2,
                         	                	    color: 'green',
                         	                	    id: 'vi'
                         	                	});
                         					},
                         					error: function(){	
                         						alert('Error while request..');
                         					}
                                     	});
                                        	
                              		}
                              	}
                          
                         	 }      
                         }
                     
                     },
                     series: [{
                         name: 'HR',
                         yAxis: 1,
                         color: 'rgba(223, 83, 83, .5)',
                         data: graph1
                     },{
                    	 name: 'HR/VO2',
                         color: 'rgba(123, 23, 23, .5)',
                         data: graph2
                     },
                     {
                   		name: 'VE-2',
                   		lineWidth: 2,
                        marker: {  radius: 3 },
                 		showInLegend: false, 
                 		draggableX: true,
                 		type: 'line',
                         draggableY: true,
                         color: 'rgba(0, 0, 0, .5)',
                           data: [graph2[0],graph2[Math.floor(graph2.length / 2)],graph2[graph2.length -5]],
                           visible:false,
                           point:{
                             	events:{
                             		click:function(){
                             			var chart1 = $("#container2").highcharts();
                                      chart1.series[2].setData([graph2[0],[this.x,this.y],graph2[graph2.length -5]],true);
                             		}
                             	}
                            }
                   	}],
                     navigation: {
                         buttonOptions: {
                             enabled: false
                         }
                     } ,
                     lang: {
                         some_key: 'Polyline',
                         right: 'Right',
                         left: 'Left'
                     },
                     exporting: {
                         buttons: {
                        	 'angle':{
                  				enabled:true,
                  				x:-62,
                  				symbol: 'url(<c:url value="/resources/images/sclae-2.png" />)',
                  				_titleKey: 'some_key',
                  				onclick:function(chart){
                  					var plotline = this.xAxis[0].plotLinesAndBands[0];
                					if(typeof plotline.options.value=='undefined')
                						{
                						alert('select threshold point to active scale');
                						}
                					else
                						{
                						var chart = $('#container2').highcharts(),
                      		            series = chart.series[2];
                      					if(this.series[2].visible){
                      						this.series[2].hide();
                      						series.hide();
                      					}
                      					else{
                      						this.series[2].show();
                      						series.show();
                      					}
                						}
                  					
                  				},
                  			},
                         	'myButton': {
                         		enabled:true,
                             	x: -32,
                             	_titleKey: 'right',
                             	onclick: function (chart) {
                					var chart= this.xAxis[0].plotLinesAndBands[0];
                					var a=chart.options.value
                                    this.xAxis[0].removePlotLine('vi');
                                    this.xAxis[0].addPlotLine({
                                    	value:+a + 1,
                                       	color:'green',
                                       	width:2,
                                       	id: 'vi'
                                    });
                                    
                                    var chart = $('#container0').highcharts();
                                    chart.xAxis[0].removePlotLine('vi');
                                    chart.xAxis[0].addPlotLine({
                                    	value:+a + 1,
                                       	color:'green',
                                       	width:2,
                                       	id:'vi'
                                    });
                                    
                                    var chart = $("#container2").highcharts();
                                   	chart.xAxis[0].removePlotLine('vi');
                                   	chart.xAxis[0].addPlotLine({
                                   		value: +a + 1,
                                   	    width: 2,
                                   	    color: 'green',
                                   	    id: 'vi'
                                   	});
                                   	
                                   	var chart = $("#container3").highcharts();
                                   	chart.xAxis[0].removePlotLine('vi');
                                   	chart.xAxis[0].addPlotLine({
                                   		value: +a + 1,
                                   	    width: 2,
                                   	    color: 'green',
                                   	    id: 'vi'
                                   	});
                                   	
                                   	var chart = $("#container6").highcharts();
                                   	chart.xAxis[0].removePlotLine('vi');
                                   	chart.xAxis[0].addPlotLine({
                                   		value: +a + 1,
                                   	    width: 2,
                                   	    color: 'green',
                                   	    id: 'vi'
                                   	});
                                   	
                                   	var chart = $("#container8").highcharts();
                                   	chart.xAxis[0].removePlotLine('vi');
                                   	chart.xAxis[0].addPlotLine({
                                   		value: +a + 1,
                                   	    width: 2,
                                   	    color: 'green',
                                   	    id: 'vi'
                                   	});
                                   	
                                   	var chart = $("#container9").highcharts();
                                   	chart.xAxis[0].removePlotLine('vi');
                                   	chart.xAxis[0].addPlotLine({
                                   		value: +a + 1,
                                   	    width: 2,
                                   	    color: 'green',
                                   	    id: 'vi'
                                   	});
                                    
                                    $('#power').val(a);
                                    $.ajax({
                                    	url : 'graphplotTime?id='+(+a + 1)+'&tableId='+$('#hiddenValue1').val(),
                       					success : function(data) {
                       						var response=$('<html />').html(data);
                       					    var anch=[];
                       					    response.find('div.result').each(function(){
                       					    	anch.push($(this).text());
                       					    });
                       					    
                       					    $('#vco2').val(anch[0]);
                       					    var chart = $("#container4").highcharts();
                       	                	chart.xAxis[0].removePlotLine('vi');
                       	                	chart.xAxis[0].addPlotLine({
                       	                		value: anch[0],
                       	                	    width: 2,
                       	                	    color: 'green',
                       	                	    id: 'vi'
                       	                	});
                       	                	
                       	                	var anch1=[];
                       					    response.find('div.result1').each(function(){
                       					    	anch1.push($(this).text());
                       					    });
                       					    
                       					    $('#vo2').val(anch1[0]);
                       					    var chart = $("#container5").highcharts();
                       	                	chart.xAxis[0].removePlotLine('vi');
                       	                	chart.xAxis[0].addPlotLine({
                       	                		value: anch1[0],
                       	                	    width: 2,
                       	                	    color: 'green',
                       	                	    id: 'vi'
                       	                	});
                       	                	
                       	                	var anch2=[];
                       					    response.find('div.result2').each(function(){
                       					    	anch2.push($(this).text());
                       					    });
                       					    
                       					 $('#ve').val(anch2[0]);
                       					    var chart = $("#container7").highcharts();
                       	                	chart.xAxis[0].removePlotLine('vi');
                       	                	chart.xAxis[0].addPlotLine({
                       	                		value: anch2[0],
                       	                	    width: 2,
                       	                	    color: 'green',
                       	                	    id: 'vi'
                       	                	});
                       					},
                       					error: function(){
                       						alert('Error while request..');
                       					}
                                    });
                				},
                             	symbol:'url(<c:url value="/resources/images/right.png" />)',
                         	},
                         	'myButton1': {
                         		enabled:true,
                             	x: -2,
                             	_titleKey: 'left',
                             	onclick: function (chart) {
                					var chart= this.xAxis[0].plotLinesAndBands[0];
                					var a=chart.options.value
                                    this.xAxis[0].removePlotLine('vi');
                                    this.xAxis[0].addPlotLine({
                                    	value:a-1,
                                       	color:'green',
                                       	width:2,
                                       	id: 'vi'
                                    });
                                    
                                    var chart = $('#container0').highcharts();
                                    chart.xAxis[0].removePlotLine('vi');
                                    chart.xAxis[0].addPlotLine({
                                    	value:a-1,
                                       	color:'green',
                                       	width:2,
                                       	id:'vi'
                                    });
                                    
                                    var chart = $("#container2").highcharts();
                                   	chart.xAxis[0].removePlotLine('vi');
                                   	chart.xAxis[0].addPlotLine({
                                   		value: a-1,
                                   	    width: 2,
                                   	    color: 'green',
                                   	    id: 'vi'
                                   	});
                                   	
                                   	var chart = $("#container3").highcharts();
                                   	chart.xAxis[0].removePlotLine('vi');
                                   	chart.xAxis[0].addPlotLine({
                                   		value: a-1,
                                   	    width: 2,
                                   	    color: 'green',
                                   	    id: 'vi'
                                   	});
                                   	
                                   	var chart = $("#container6").highcharts();
                                   	chart.xAxis[0].removePlotLine('vi');
                                   	chart.xAxis[0].addPlotLine({
                                   		value: a-1,
                                   	    width: 2,
                                   	    color: 'green',
                                   	    id: 'vi'
                                   	});
                                   	
                                   	var chart = $("#container8").highcharts();
                                   	chart.xAxis[0].removePlotLine('vi');
                                   	chart.xAxis[0].addPlotLine({
                                   		value: a-1,
                                   	    width: 2,
                                   	    color: 'green',
                                   	    id: 'vi'
                                   	});
                                   	
                                   	var chart = $("#container9").highcharts();
                                   	chart.xAxis[0].removePlotLine('vi');
                                   	chart.xAxis[0].addPlotLine({
                                   		value: a-1,
                                   	    width: 2,
                                   	    color: 'green',
                                   	    id: 'vi'
                                   	});
                                    
                                    $('#power').val(a);
                                    $.ajax({
                                    	url : 'graphplotTime?id='+(+a + 1)+'&tableId='+$('#hiddenValue1').val(),
                       					success : function(data) {
                       						var response=$('<html />').html(data);
                       					    var anch=[];
                       					    response.find('div.result').each(function(){
                       					    	anch.push($(this).text());
                       					    });
                       					    
                       					    $('#vco2').val(anch[0]);
                       					    var chart = $("#container4").highcharts();
                       	                	chart.xAxis[0].removePlotLine('vi');
                       	                	chart.xAxis[0].addPlotLine({
                       	                		value: anch[0],
                       	                	    width: 2,
                       	                	    color: 'green',
                       	                	    id: 'vi'
                       	                	});
                       	                	
                       	                	var anch1=[];
                       					    response.find('div.result1').each(function(){
                       					    	anch1.push($(this).text());
                       					    });
                       					    
                       					    $('#vo2').val(anch1[0]);
                       					    var chart = $("#container5").highcharts();
                       	                	chart.xAxis[0].removePlotLine('vi');
                       	                	chart.xAxis[0].addPlotLine({
                       	                		value: anch1[0],
                       	                	    width: 2,
                       	                	    color: 'green',
                       	                	    id: 'vi'
                       	                	});
                       	                	
                       	                	var anch2=[];
                       					    response.find('div.result2').each(function(){
                       					    	anch2.push($(this).text());
                       					    });
                       					    
                       					 $('#ve').val(anch2[0]);
                       					    var chart = $("#container7").highcharts();
                       	                	chart.xAxis[0].removePlotLine('vi');
                       	                	chart.xAxis[0].addPlotLine({
                       	                		value: anch2[0],
                       	                	    width: 2,
                       	                	    color: 'green',
                       	                	    id: 'vi'
                       	                	});
                       					},
                       					error: function(){
                       						alert('Error while request..');
                       					}
                                    });
                				},
                             	symbol:'url(<c:url value="/resources/images/left.png" />)',
                         	}
                         }
                     }
                	
                });
                
                /*chart-3*/
                createGraph({
                	credits: {
         			      enabled: false
         			  },
             		
             		tooltip: {
                         crosshairs: true
                     },
                       chart: {
                           renderTo: 'container3',
                           type: 'scatter',
                           events: {}
                       },
                       title: {
                       	text: '3'
                       },
                       xAxis: {
                       	
                           title: {
                               enabled: true,
                               text: 'Power (watt)'
                           },
                           min:0,
                           plotLines: [{
                   			id: 'vi',
                               color: 'green',
                               width: 2,
                               value:data1[0] 
                   		}],
                           startOnTick: true,
                           endOnTick: true,
                           showLastLabel: true
                       },
                       
                       yAxis: [{
                           title: {
                               text: 'VCO2 (L/min)'
                           },
                           opposite:true,
                           min:0,
                           max:5,
                           tickInterval: 1
                       },
                       {
                       	title: {
                       		text: 'VO2 (L/min)'
                       	},
                       	min:0,
                       	max:5,
                           tickInterval: 1
                       }],
                       
                       legend: {
                           layout: 'vertical',
                           align: 'left',
                           verticalAlign: 'top',
                           x: 100,
                           y: 40,
                           floating: true,
                           backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF',
                           borderWidth: 1
                       },
                       tooltip: {
                        	 crosshairs: true,
                     		formatter: function() {
                     			if(this.series.name == 'VE-2'){
                     				return false;	
                     			}
                     			else if(this.series.name == 'VO2')
                     				{
                     				return '<b>'+ this.series.name +'</b><br/>'+
                    				this.point.x+ ' watt,'+ this.point.y.toFixed(2)+' L/min';
                     				
                     				}
                     			else if (this.series.name == 'VCO2'){
                     				return '<b>'+ this.series.name +'</b><br/>'+
                    				this.point.x+ ' watt,'+ this.point.y.toFixed(2)+' L/min';
                     			}
                     		}
                 		},
                       plotOptions: {
                           scatter: {
                               marker: {
                               	radius: 3,
                                   states: {
                                       hover: {
                                           enabled: true,
                                           lineColor: 'rgb(100,100,100)'
                                       }
                                   }
                               },
                               states: {
                                   hover: {
                                       marker: {
                                           enabled: false
                                       }
                                   }
                               },
                               
                              
                           },
                           series: {
                                 point:{
                				events:{
                					click:function(){
                						var chart= this.series.chart.xAxis[0];
                                        chart.removePlotLine('vi');
                                        chart.addPlotLine({
                                        	value:this.x,
                                           	color:'green',
                                           	width:2,
                                           	id:'vi'
                                        });
                                        $('#hiddenValue').val(this.x);
                                        $('#power').val(this.x);
                                        $('#ve').val(this.y);
                                           			
                                        var chart = $("#container0").highcharts();
                                       	chart.xAxis[0].removePlotLine('vi');
                                       	chart.xAxis[0].addPlotLine({
                                       		value: this.x,
                                       	    width: 2,
                                       	    color: 'green',
                                       	    id: 'vi'
                                       	});
                                       	
                                       	var chart = $("#container2").highcharts();
                                       	chart.xAxis[0].removePlotLine('vi');
                                       	chart.xAxis[0].addPlotLine({
                                       		value: this.x,
                                       	    width: 2,
                                       	    color: 'green',
                                       	    id: 'vi'
                                       	});
                                       	
                                       	var chart = $("#container3").highcharts();
                                       	chart.xAxis[0].removePlotLine('vi');
                                       	chart.xAxis[0].addPlotLine({
                                       		value: this.x,
                                       	    width: 2,
                                       	    color: 'green',
                                       	    id: 'vi'
                                       	});
                                       	
                                       	var chart = $("#container6").highcharts();
                                       	chart.xAxis[0].removePlotLine('vi');
                                       	chart.xAxis[0].addPlotLine({
                                       		value: this.x,
                                       	    width: 2,
                                       	    color: 'green',
                                       	    id: 'vi'
                                       	});
                                       	
                                       	var chart = $("#container8").highcharts();
                                       	chart.xAxis[0].removePlotLine('vi');
                                       	chart.xAxis[0].addPlotLine({
                                       		value: this.x,
                                       	    width: 2,
                                       	    color: 'green',
                                       	    id: 'vi'
                                       	});
                                       	
                                       	var chart = $("#container9").highcharts();
                                       	chart.xAxis[0].removePlotLine('vi');
                                       	chart.xAxis[0].addPlotLine({
                                       		value: this.x,
                                       	    width: 2,
                                       	    color: 'green',
                                       	    id: 'vi'
                                       	});
                                       	
                                       	$.ajax({
                                       		url : 'graphplotTime?id='+this.x+'&tableId='+$('#hiddenValue1').val(),
                           					success : function(data) {
                           						var response=$('<html />').html(data);
                           					    var anch=[];
                           					    response.find('div.result').each(function(){
                           					    	anch.push($(this).text());
                           					    });
                           					    
                           					    $('#vco2').val(anch[0]);
                           					    var chart = $("#container4").highcharts();
                           	                	chart.xAxis[0].removePlotLine('vi');
                           	                	chart.xAxis[0].addPlotLine({
                           	                		value: anch[0],
                           	                	    width: 2,
                           	                	    color: 'green',
                           	                	    id: 'vi'
                           	                	});
                           	                	
                           	                	var anch1=[];
                           					    response.find('div.result1').each(function(){
                           					    	anch1.push($(this).text());
                           					    });
                           					    
                           					    $('#vo2').val(anch1[0]);
                           					    var chart = $("#container5").highcharts();
                           	                	chart.xAxis[0].removePlotLine('vi');
                           	                	chart.xAxis[0].addPlotLine({
                           	                		value: anch1[0],
                           	                	    width: 2,
                           	                	    color: 'green',
                           	                	    id: 'vi'
                           	                	});
                           	                	
                           	                	var anch2=[];
                           					    response.find('div.result2').each(function(){
                           					    	anch2.push($(this).text());
                           					    });
                           					    
                           					    var chart = $("#container7").highcharts();
                           	                	chart.xAxis[0].removePlotLine('vi');
                           	                	chart.xAxis[0].addPlotLine({
                           	                		value: anch2[0],
                           	                	    width: 2,
                           	                	    color: 'green',
                           	                	    id: 'vi'
                           	                	});
                           					},
                           					error: function(){	
                           						alert('Error while request..');
                           					}
                                       	});
                           			}
                				}
                               }     
                           }
                       
                       
                       },
                       series: [{
                           name: 'VO2',
                           yAxis:1,
                           color: 'rgba(223, 83, 83, .5)',
                           data: graph3
                       },
                       {
                    	   name: 'VCO2',
                           color: 'rgba(23, 183, 183, .5)',
                           data: graph4
                       },
                       {
                   		name: 'VE-2',
                   		lineWidth: 2,
                        marker: {  radius: 3 },
                 		showInLegend: false, 
                 		draggableX: true,
                 		type: 'line',
                         draggableY: true,
                         color: 'rgba(0, 0, 0, .5)',
                           data: [graph4[0],graph4[Math.floor(graph4.length / 2)],graph4[graph4.length -5]],
                           visible: false,
                           point:{
                             	events:{
                             		click:function(){
                             			var chart1 = $("#container3").highcharts();
                                      chart1.series[2].setData([graph4[0],[this.x,this.y],graph4[graph4.length -5]],true);
                             		}
                             	}
                            }
                   	}],
                       navigation: {
                           buttonOptions: {
                               enabled: false
                           }
                       } ,
                       lang: {
                           some_key: 'Polyline',
                           right: 'Right',
                           left: 'Left'
                       },
                       exporting: {
                           buttons: {
                        	   'angle':{
                   				enabled:true,
                   				x:-62,
                   				symbol: 'url(<c:url value="/resources/images/sclae-2.png" />)',
                   				_titleKey: 'some_key',
                   				onclick:function(chart){
                   					var plotline = this.xAxis[0].plotLinesAndBands[0];
                					if(typeof plotline.options.value=='undefined')
                						{
                						alert('select threshold point to active scale');
                						}
                					else
                						{
                						var chart = $('#container3').highcharts(),
                       		            series = chart.series[2];
                       					if(this.series[2].visible){
                       						this.series[2].hide();
                       						series.hide();
                       					}
                       					else{
                       						this.series[2].show();
                       						series.show();
                       					}
                						}
                   					
                   				},
                   			},
                           	'myButton': {
                           		enabled:true,
                               	x: -32,
                               	_titleKey: 'right',
                               	onclick: function (chart) {
                					var chart= this.xAxis[0].plotLinesAndBands[0];
                					var a=chart.options.value
                                    this.xAxis[0].removePlotLine('vi');
                                    this.xAxis[0].addPlotLine({
                                    	value:+a + 1,
                                       	color:'green',
                                       	width:2,
                                       	id:'vi'
                                    });
                                    
                                    var chart = $('#container0').highcharts();
                                    chart.xAxis[0].removePlotLine('vi');
                                    chart.xAxis[0].addPlotLine({
                                    	value:+a + 1,
                                       	color:'green',
                                       	width:2,
                                       	id:'vi'
                                    });
                                    
                                    var chart = $("#container2").highcharts();
                                   	chart.xAxis[0].removePlotLine('vi');
                                   	chart.xAxis[0].addPlotLine({
                                   		value: +a + 1,
                                   	    width: 2,
                                   	    color: 'green',
                                   	    id: 'vi'
                                   	});
                                   	
                                   	var chart = $("#container3").highcharts();
                                   	chart.xAxis[0].removePlotLine('vi');
                                   	chart.xAxis[0].addPlotLine({
                                   		value: +a + 1,
                                   	    width: 2,
                                   	    color: 'green',
                                   	    id: 'vi'
                                   	});
                                   	
                                   	var chart = $("#container6").highcharts();
                                   	chart.xAxis[0].removePlotLine('vi');
                                   	chart.xAxis[0].addPlotLine({
                                   		value: +a + 1,
                                   	    width: 2,
                                   	    color: 'green',
                                   	    id: 'vi'
                                   	});
                                   	
                                   	var chart = $("#container8").highcharts();
                                   	chart.xAxis[0].removePlotLine('vi');
                                   	chart.xAxis[0].addPlotLine({
                                   		value: +a + 1,
                                   	    width: 2,
                                   	    color: 'green',
                                   	    id: 'vi'
                                   	});
                                   	
                                   	var chart = $("#container9").highcharts();
                                   	chart.xAxis[0].removePlotLine('vi');
                                   	chart.xAxis[0].addPlotLine({
                                   		value: +a + 1,
                                   	    width: 2,
                                   	    color: 'green',
                                   	    id: 'vi'
                                   	});
                                    
                                    $('#power').val(a);
                                    $.ajax({
                                    	url : 'graphplotTime?id='+(+a + 1)+'&tableId='+$('#hiddenValue1').val(),
                       					success : function(data) {
                       						var response=$('<html />').html(data);
                       					    var anch=[];
                       					    response.find('div.result').each(function(){
                       					    	anch.push($(this).text());
                       					    });
                       					    
                       					    $('#vco2').val(anch[0]);
                       					    var chart = $("#container4").highcharts();
                       	                	chart.xAxis[0].removePlotLine('vi');
                       	                	chart.xAxis[0].addPlotLine({
                       	                		value: anch[0],
                       	                	    width: 2,
                       	                	    color: 'green',
                       	                	    id: 'vi'
                       	                	});
                       	                	
                       	                	var anch1=[];
                       					    response.find('div.result1').each(function(){
                       					    	anch1.push($(this).text());
                       					    });
                       					    
                       					    $('#vo2').val(anch1[0]);
                       					    var chart = $("#container5").highcharts();
                       	                	chart.xAxis[0].removePlotLine('vi');
                       	                	chart.xAxis[0].addPlotLine({
                       	                		value: anch1[0],
                       	                	    width: 2,
                       	                	    color: 'green',
                       	                	    id: 'vi'
                       	                	});
                       	                	
                       	                	var anch2=[];
                       					    response.find('div.result2').each(function(){
                       					    	anch2.push($(this).text());
                       					    });
                       					    
                       					 $('#ve').val(anch2[0]);
                       					    var chart = $("#container7").highcharts();
                       	                	chart.xAxis[0].removePlotLine('vi');
                       	                	chart.xAxis[0].addPlotLine({
                       	                		value: anch2[0],
                       	                	    width: 2,
                       	                	    color: 'green',
                       	                	    id: 'vi'
                       	                	});
                       					},
                       					error: function(){
                       						alert('Error while request..');
                       					}
                                    });
                				},
                               	symbol:'url(<c:url value="/resources/images/right.png" />)',
                           	},
                           	'myButton1': {
                           		enabled:true,
                               	x: -2,
                               	_titleKey: 'left',
                               	onclick: function (chart) {
                					var chart= this.xAxis[0].plotLinesAndBands[0];
                					var a=chart.options.value
                                    this.xAxis[0].removePlotLine('vi');
                                    this.xAxis[0].addPlotLine({
                                    	value:a-1,
                                       	color:'green',
                                       	width:2,
                                       	id:'vi'
                                    });
                                    
                                    var chart = $('#container0').highcharts();
                                    chart.xAxis[0].removePlotLine('vi');
                                    chart.xAxis[0].addPlotLine({
                                    	value:a-1,
                                       	color:'green',
                                       	width:2,
                                       	id:'vi'
                                    });
                                    
                                    var chart = $("#container2").highcharts();
                                   	chart.xAxis[0].removePlotLine('vi');
                                   	chart.xAxis[0].addPlotLine({
                                   		value: a-1,
                                   	    width: 2,
                                   	    color: 'green',
                                   	    id: 'vi'
                                   	});
                                   	
                                   	var chart = $("#container3").highcharts();
                                   	chart.xAxis[0].removePlotLine('vi');
                                   	chart.xAxis[0].addPlotLine({
                                   		value: a-1,
                                   	    width: 2,
                                   	    color: 'green',
                                   	    id: 'vi'
                                   	});
                                   	
                                   	var chart = $("#container6").highcharts();
                                   	chart.xAxis[0].removePlotLine('vi');
                                   	chart.xAxis[0].addPlotLine({
                                   		value: a-1,
                                   	    width: 2,
                                   	    color: 'green',
                                   	    id: 'vi'
                                   	});
                                   	
                                   	var chart = $("#container8").highcharts();
                                   	chart.xAxis[0].removePlotLine('vi');
                                   	chart.xAxis[0].addPlotLine({
                                   		value: a-1,
                                   	    width: 2,
                                   	    color: 'green',
                                   	    id: 'vi'
                                   	});
                                   	
                                   	var chart = $("#container9").highcharts();
                                   	chart.xAxis[0].removePlotLine('vi');
                                   	chart.xAxis[0].addPlotLine({
                                   		value: a-1,
                                   	    width: 2,
                                   	    color: 'green',
                                   	    id: 'vi'
                                   	});
                                    
                                    $('#power').val(a);
                                    $.ajax({
                                    	url : 'graphplotTime?id='+(+a + 1)+'&tableId='+$('#hiddenValue1').val(),
                       					success : function(data) {
                       						var response=$('<html />').html(data);
                       					    var anch=[];
                       					    response.find('div.result').each(function(){
                       					    	anch.push($(this).text());
                       					    });
                       					    
                       					    $('#vco2').val(anch[0]);
                       					    var chart = $("#container4").highcharts();
                       	                	chart.xAxis[0].removePlotLine('vi');
                       	                	chart.xAxis[0].addPlotLine({
                       	                		value: anch[0],
                       	                	    width: 2,
                       	                	    color: 'green',
                       	                	    id: 'vi'
                       	                	});
                       	                	
                       	                	var anch1=[];
                       					    response.find('div.result1').each(function(){
                       					    	anch1.push($(this).text());
                       					    });
                       					    
                       					    $('#vo2').val(anch1[0]);
                       					    var chart = $("#container5").highcharts();
                       	                	chart.xAxis[0].removePlotLine('vi');
                       	                	chart.xAxis[0].addPlotLine({
                       	                		value: anch1[0],
                       	                	    width: 2,
                       	                	    color: 'green',
                       	                	    id: 'vi'
                       	                	});
                       	                	
                       	                	var anch2=[];
                       					    response.find('div.result2').each(function(){
                       					    	anch2.push($(this).text());
                       					    });
                       					    
                       					 $('#ve').val(anch2[0]);
                       					    var chart = $("#container7").highcharts();
                       	                	chart.xAxis[0].removePlotLine('vi');
                       	                	chart.xAxis[0].addPlotLine({
                       	                		value: anch2[0],
                       	                	    width: 2,
                       	                	    color: 'green',
                       	                	    id: 'vi'
                       	                	});
                       					},
                       					error: function(){
                       						alert('Error while request..');
                       					}
                                    });
                				},
                               	symbol:'url(<c:url value="/resources/images/left.png" />)',
                           	}
                           }
                       }
                	
                });
                
                /*chart-4*/
                createGraph({
                	credits: {
       			      enabled: false
       			  },
           		
           		tooltip: {
                       crosshairs: true
                   },
                     chart: {
                         renderTo: 'container4',
                         type: 'scatter',
                         events: {}
                     },
                     title: {
                     	text: '4'
                     },
                     xAxis: {
                     	
                         title: {
                             enabled: true,
                             text: 'VCO2 (L/min)'
                         },
                         plotLines: [{
                 			id: 'vi',
                             color: 'green',
                             width: 2,
                             value:data4[0] 
                 		}],
                         startOnTick: true,
                         endOnTick: true,
                         showLastLabel: true
                         
                     },
                     
                     yAxis: {
                         title: {
                             text: 'VE (L/min)'
                         },
                     },
                     
                     legend: {
                         layout: 'vertical',
                         align: 'left',
                         verticalAlign: 'top',
                         x: 100,
                         y: 40,
                         floating: true,
                         backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF',
                         borderWidth: 1
                     },
                     tooltip: {
                      	 crosshairs: true,
                   		formatter: function() {
                   			if(this.series.name == 'VE-2'){
                   				return false;	
                   			}
                   			else if(this.series.name == 'VE')
                   				{
                   				return '<b>'+ this.series.name +'</b><br/>'+
                  				this.point.x.toFixed(2)+ ' L/min,'+ this.point.y+' L/min';
                   				
                   				}
                   			
                   		}
               		},
                     plotOptions: {
                         scatter: {
                             marker: {
                             	radius: 3,
                                 states: {
                                     hover: {
                                         enabled: true,
                                         lineColor: 'rgb(100,100,100)'
                                     }
                                 }
                             },
                             states: {
                                 hover: {
                                     marker: {
                                         enabled: false
                                     }
                                 }
                             },
                             
                            
                         },
                         series: {
                               point:{
                             	events:{
                             		click:function(){
                             			var chart= this.series.chart.xAxis[0];
                                         chart.removePlotLine('vi');
                                         chart.addPlotLine({
                                         	value:this.x,
                                            	color:'green',
                                            	width:2,
                                            	id:'vi'
                                         });
                                         $('#hiddenVCO2').val(this.x);
                                         $('#hiddenVE').val(this.y);
                                         $('#vco2').val(this.x);
                                         $('#ve').val(this.y);
                                         
                                        var chart = $("#container4").highcharts();
                                     	chart.xAxis[0].removePlotLine('vi');
                                     	chart.xAxis[0].addPlotLine({
                                     		value: this.x,
                                     	    width: 2,
                                     	    color: 'green',
                                     	    id: 'vi'
                                     	});
                                         
                                         var chart = $("#container7").highcharts();
                                        	chart.xAxis[0].removePlotLine('vi');
                                        	chart.xAxis[0].addPlotLine({
                                        		value: this.y,
                                        	    width: 2,
                                        	    color: 'green',
                                        	    id: 'vi'
                                        	});
                                        	
                                         $.ajax({
                                        		url : 'graphplotVCO2?VCO2='+this.x+'&VE='+this.y+'&tableId='+$('#hiddenValue1').val(),
                            					success : function(data) {
                            						var response=$('<html />').html(data);
                            						var anch=[];
                            					    response.find('div.result').each(function(){
                            					    	anch.push($(this).text());
                            					    });
                            					    
                            					    $('#vo2').val(anch[0]);
                               					    var chart = $("#container5").highcharts();
                               	                	chart.xAxis[0].removePlotLine('vi');
                               	                	chart.xAxis[0].addPlotLine({
                               	                		value: anch[0],
                               	                	    width: 2,
                               	                	    color: 'green',
                               	                	    id: 'vi'
                               	                	});
                               	                	
                               	                	var anch1=[];
                               					    response.find('div.result1').each(function(){
                               					    	anch1.push($(this).text());
                               					    });
                               					    
                               					    $('#power').val(anch1[0]);
                               					    var chart = $("#container6").highcharts();
                               	                	chart.xAxis[0].removePlotLine('vi');
                               	                	chart.xAxis[0].addPlotLine({
                               	                		value: anch1[0],
                               	                	    width: 2,
                               	                	    color: 'green',
                               	                	    id: 'vi'
                               	                	});
                               	                	
                               	                	var chart = $("#container0").highcharts();
                               	                	chart.xAxis[0].removePlotLine('vi');
                               	                	chart.xAxis[0].addPlotLine({
                               	                		value: anch1[0],
                               	                	    width: 2,
                               	                	    color: 'green',
                               	                	    id: 'vi'
                               	                	});
                               	                	
                               	                	var chart = $("#container2").highcharts();
                               	                	chart.xAxis[0].removePlotLine('vi');
                               	                	chart.xAxis[0].addPlotLine({
                               	                		value: anch1[0],
                               	                	    width: 2,
                               	                	    color: 'green',
                               	                	    id: 'vi'
                               	                	});
                               	                	
                               	                	var chart = $("#container3").highcharts();
                               	                	chart.xAxis[0].removePlotLine('vi');
                               	                	chart.xAxis[0].addPlotLine({
                               	                		value: anch1[0],
                               	                	    width: 2,
                               	                	    color: 'green',
                               	                	    id: 'vi'
                               	                	});
                               	                	
                               	                	var chart = $("#container8").highcharts();
                               	                	chart.xAxis[0].removePlotLine('vi');
                               	                	chart.xAxis[0].addPlotLine({
                               	                		value: anch1[0],
                               	                	    width: 2,
                               	                	    color: 'green',
                               	                	    id: 'vi'
                               	                	});
                               	                	
                               	                	var chart = $("#container9").highcharts();
                               	                	chart.xAxis[0].removePlotLine('vi');
                               	                	chart.xAxis[0].addPlotLine({
                               	                		value: anch1[0],
                               	                	    width: 2,
                               	                	    color: 'green',
                               	                	    id: 'vi'
                               	                	});
                            					    
                            					},
                            					error: function(){	
                            						alert('Error while request..');
                            					}
                                        	});	
                             		}
                             	}
                             }     
                         }
                     
                     
                     },
                     series: [{
                         name: 'VE',
                         color: 'rgba(223, 83, 83, .5)',
                         data: graph5
                     },
                     {
                  		name: 'VE-2',
                  		lineWidth: 2,
                        marker: {  radius: 3 },
                 		showInLegend: false, 
                 		draggableX: true,
                 		type: 'line',
                         draggableY: true,
                         color: 'rgba(0, 0, 0, .5)',
                          data: [graph5[0],graph5[Math.floor(graph5.length / 2)],graph5[graph5.length -5]],
                          visible:false,
                          point:{
                            	events:{
                            		click:function(){
                            			var chart1 = $("#container4").highcharts();
                                     chart1.series[1].setData([graph5[0],[this.x,this.y],graph5[graph5.length -5]],true);
                            		}
                            	}
                           }
                  	}],
                     navigation: {
                         buttonOptions: {
                             enabled: false
                         }
                     } ,
                     lang: {
                         some_key: 'Polyline',
                         right: 'Right',
                         left: 'Left'
                     },
                     exporting: {
                         buttons: {
                        	 'angle':{
                   				enabled:true,
                   				x:-62,
                   				symbol: 'url(<c:url value="/resources/images/sclae-2.png" />)',
                   				_titleKey: 'some_key',
                   				onclick:function(chart){
                   					var plotline = this.xAxis[0].plotLinesAndBands[0];
                					if(typeof plotline.options.value=='undefined')
                						{
                						alert('select threshold point to active scale');
                						}
                					else
                						{
                						var chart = $('#container4').highcharts(),
                       		            series = chart.series[1];
                       					if(this.series[1].visible){
                       						this.series[1].hide();
                       						series.hide();
                       					}
                       					else{
                       						this.series[1].show();
                       						series.show();
                       					}
                						}
                   					
                   				},
                   			},
                         	'myButton': {
                         		enabled:true,
                             	x: -32,
                             	_titleKey: 'right',
                             	onclick: function (chart) {
                             		var a = $('#power').val();
                             		var chart = $('#container0').highcharts();
                                    chart.xAxis[0].removePlotLine('vi');
                                    chart.xAxis[0].addPlotLine({
                                    	value:+a+1,
                                       	color:'green',
                                       	width:2,
                                       	id:'vi'
                                    });
                                    
                                    var chart = $("#container2").highcharts();
                                   	chart.xAxis[0].removePlotLine('vi');
                                   	chart.xAxis[0].addPlotLine({
                                   		value: +a+1,
                                   	    width: 2,
                                   	    color: 'green',
                                   	    id: 'vi'
                                   	});
                                   	
                                   	var chart = $("#container3").highcharts();
                                   	chart.xAxis[0].removePlotLine('vi');
                                   	chart.xAxis[0].addPlotLine({
                                   		value: +a+1,
                                   	    width: 2,
                                   	    color: 'green',
                                   	    id: 'vi'
                                   	});
                                   	
                                   	var chart = $("#container6").highcharts();
                                   	chart.xAxis[0].removePlotLine('vi');
                                   	chart.xAxis[0].addPlotLine({
                                   		value: +a+1,
                                   	    width: 2,
                                   	    color: 'green',
                                   	    id: 'vi'
                                   	});
                                   	
                                   	var chart = $("#container8").highcharts();
                                   	chart.xAxis[0].removePlotLine('vi');
                                   	chart.xAxis[0].addPlotLine({
                                   		value: +a+1,
                                   	    width: 2,
                                   	    color: 'green',
                                   	    id: 'vi'
                                   	});
                                   	
                                   	var chart = $("#container9").highcharts();
                                   	chart.xAxis[0].removePlotLine('vi');
                                   	chart.xAxis[0].addPlotLine({
                                   		value: +a+1,
                                   	    width: 2,
                                   	    color: 'green',
                                   	    id: 'vi'
                                   	});
                                   	$('#power').val(+a + 1);
                                   	var value= +a +1;
                                   	$.ajax({
                                   		url : 'graphplotTime?id='+(value)+'&tableId='+$('#hiddenValue1').val(),
                       					success : function(data) {
                       						var response=$('<html />').html(data);
                       					    var anch=[];
                       					    response.find('div.result').each(function(){
                       					    	anch.push($(this).text());
                       					    });
                       					 $('#vco2').val(anch[0]);
                    					    var chart = $("#container4").highcharts();
                    	                	chart.xAxis[0].removePlotLine('vi');
                    	                	chart.xAxis[0].addPlotLine({
                    	                		value: anch[0],
                    	                	    width: 2,
                    	                	    color: 'green',
                    	                	    id: 'vi'
                    	                	}); 
                    	                	var anch1=[];
                       					    response.find('div.result1').each(function(){
                       					    	anch1.push($(this).text());
                       					    });
                       					    
                       					    $('#vo2').val(anch1[0]);
                       					    var chart = $("#container5").highcharts();
                       	                	chart.xAxis[0].removePlotLine('vi');
                       	                	chart.xAxis[0].addPlotLine({
                       	                		value: anch1[0],
                       	                	    width: 2,
                       	                	    color: 'green',
                       	                	    id: 'vi'
                       	                	});
                       	                	
                       	                	var anch2=[];
                       					    response.find('div.result2').each(function(){
                       					    	anch2.push($(this).text());
                       					    });
                       					    
                       					 $('#ve').val(anch2[0]);
                       					    var chart = $("#container7").highcharts();
                       	                	chart.xAxis[0].removePlotLine('vi');
                       	                	chart.xAxis[0].addPlotLine({
                       	                		value: anch2[0],
                       	                	    width: 2,
                       	                	    color: 'green',
                       	                	    id: 'vi'
                       	                	});    
                                   	},
                                   	error: function(){
                   						alert('Error while request..');
                   					}
                                   	});
                             	},
                             	symbol:'url(<c:url value="/resources/images/right.png" />)',
                         	},
                         	'myButton1': {
                         		enabled:true,
                             	x: -2,
                             	_titleKey: 'left',
                             	onclick: function (chart) {
                             		var a = $('#power').val();
                             		var chart = $('#container0').highcharts();
                                    chart.xAxis[0].removePlotLine('vi');
                                    chart.xAxis[0].addPlotLine({
                                    	value:+a-1,
                                       	color:'green',
                                       	width:2,
                                       	id:'vi'
                                    });
                                    
                                    var chart = $("#container2").highcharts();
                                   	chart.xAxis[0].removePlotLine('vi');
                                   	chart.xAxis[0].addPlotLine({
                                   		value: +a-1,
                                   	    width: 2,
                                   	    color: 'green',
                                   	    id: 'vi'
                                   	});
                                   	
                                   	var chart = $("#container3").highcharts();
                                   	chart.xAxis[0].removePlotLine('vi');
                                   	chart.xAxis[0].addPlotLine({
                                   		value: +a-1,
                                   	    width: 2,
                                   	    color: 'green',
                                   	    id: 'vi'
                                   	});
                                   	
                                   	var chart = $("#container6").highcharts();
                                   	chart.xAxis[0].removePlotLine('vi');
                                   	chart.xAxis[0].addPlotLine({
                                   		value: +a-1,
                                   	    width: 2,
                                   	    color: 'green',
                                   	    id: 'vi'
                                   	});
                                   	
                                   	var chart = $("#container8").highcharts();
                                   	chart.xAxis[0].removePlotLine('vi');
                                   	chart.xAxis[0].addPlotLine({
                                   		value: +a-1,
                                   	    width: 2,
                                   	    color: 'green',
                                   	    id: 'vi'
                                   	});
                                   	
                                   	var chart = $("#container9").highcharts();
                                   	chart.xAxis[0].removePlotLine('vi');
                                   	chart.xAxis[0].addPlotLine({
                                   		value: +a-1,
                                   	    width: 2,
                                   	    color: 'green',
                                   	    id: 'vi'
                                   	});
                                   	$('#power').val(+a - 1);
                                   	var value= +a -1;
                                   	$.ajax({
                                   		url : 'graphplotTime?id='+(value)+'&tableId='+$('#hiddenValue1').val(),
                       					success : function(data) {
                       						var response=$('<html />').html(data);
                       					    var anch=[];
                       					    response.find('div.result').each(function(){
                       					    	anch.push($(this).text());
                       					    });
                       					 $('#vco2').val(anch[0]);
                    					    var chart = $("#container4").highcharts();
                    	                	chart.xAxis[0].removePlotLine('vi');
                    	                	chart.xAxis[0].addPlotLine({
                    	                		value: anch[0],
                    	                	    width: 2,
                    	                	    color: 'green',
                    	                	    id: 'vi'
                    	                	}); 
                    	                	var anch1=[];
                       					    response.find('div.result1').each(function(){
                       					    	anch1.push($(this).text());
                       					    });
                       					    
                       					    $('#vo2').val(anch1[0]);
                       					    var chart = $("#container5").highcharts();
                       	                	chart.xAxis[0].removePlotLine('vi');
                       	                	chart.xAxis[0].addPlotLine({
                       	                		value: anch1[0],
                       	                	    width: 2,
                       	                	    color: 'green',
                       	                	    id: 'vi'
                       	                	});
                       	                	
                       	                	var anch2=[];
                       					    response.find('div.result2').each(function(){
                       					    	anch2.push($(this).text());
                       					    });
                       					    
                       					 $('#ve').val(anch2[0]);
                       					    var chart = $("#container7").highcharts();
                       	                	chart.xAxis[0].removePlotLine('vi');
                       	                	chart.xAxis[0].addPlotLine({
                       	                		value: anch2[0],
                       	                	    width: 2,
                       	                	    color: 'green',
                       	                	    id: 'vi'
                       	                	});    
                                   	},
                                   	error: function(){
                   						alert('Error while request..');
                   					}
                                   	});
                             	},
                             	symbol:'url(<c:url value="/resources/images/left.png" />)',
                         	}
                         }
                     }
                	
                });
                
                /*chart-5*/
                createGraph({
                	credits: {
         			      enabled: false
         			  },
             		
             		tooltip: {
                         crosshairs: true
                     },
                       chart: {
                           renderTo: 'container5',
                           type: 'scatter',
                           events: {}
                       },
                       title: {
                       	text: '5'
                       },
                       xAxis: {
                       	
                           title: {
                               enabled: true,
                               text: 'VO2 (L/min)'
                           },
                           plotLines: [{
                   			id: 'vi',
                               color: 'green',
                               width: 2,
                               value:data3[0] 
                   		}],
                           startOnTick: true,
                           endOnTick: true,
                           showLastLabel: true
                       },
                       
                       yAxis: [{
                           title: {
                               text: 'VCO2 (L/min)'
                           },
                           opposite: true
                       },
                       {
                           title: {
                           	text: 'HR (min)'
                           },
                           min:0,
                           tickInterval: 30
                       }],
                       
                       legend: {
                           layout: 'vertical',
                           align: 'left',
                           verticalAlign: 'top',
                           x: 100,
                           y: 40,
                           floating: true,
                           backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF',
                           borderWidth: 1
                       },
                       tooltip: {
                      	 crosshairs: true,
                   		formatter: function() {
                   			if(this.series.name == 'VE-2'){
                   				return false;	
                   			}
                   			else if(this.series.name == 'HR')
                   				{
                   				return '<b>'+ this.series.name +'</b><br/>'+
                  				this.point.x.toFixed(2)+ ' L/min,'+ this.point.y+' beat';
                   				
                   				}
                   			else if (this.series.name == 'VCO2'){
                   				return '<b>'+ this.series.name +'</b><br/>'+
                  				this.point.x.toFixed(2)+ ' L/min,'+ this.point.y.toFixed(2)+' L/min';
                   			}
                   		}
               		},
                       plotOptions: {
                           scatter: {
                               marker: {
                               	radius: 3,
                                   states: {
                                       hover: {
                                           enabled: true,
                                           lineColor: 'rgb(100,100,100)'
                                       }
                                   }
                               },
                               states: {
                                   hover: {
                                       marker: {
                                           enabled: false
                                       }
                                   }
                               },
                               
                           },
                           series: {
                               point:{
                             	events:{
                             		click:function(){
                             			var chart= this.series.chart.xAxis[0];
                                        chart.removePlotLine('vi');
                                        chart.addPlotLine({
                                        	value:this.x,
                                           	color:'green',
                                           	width:2,
                                           	id:'vi'
                                        });
                                        $('#hiddenVO2').val(this.x);
                                        $('#vo2').val(this.x);
                                        var chart = $("#container5").highcharts();
                                     	chart.xAxis[0].removePlotLine('vi');
                                     	chart.xAxis[0].addPlotLine({
                                     		value: this.x,
                                     	    width: 2,
                                     	    color: 'green',
                                     	    id: 'vi'
                                     	});
                                     	$('#vco2').val(this.y);
                                        var chart = $("#container4").highcharts();
                                     	chart.xAxis[0].removePlotLine('vi');
                                     	chart.xAxis[0].addPlotLine({
                                     		value: this.y,
                                     	    width: 2,
                                     	    color: 'green',
                                     	    id: 'vi'
                                     	});
                                     	$.ajax({
                                     		url : 'graphplotVO2?VO2='+this.x+'&VCO2='+this.y+'&tableId='+$('#hiddenValue1').val(),
                        					success : function(data) {
                        						var response=$('<html />').html(data);
                        						var anch=[];
                        					    response.find('div.result').each(function(){
                        					    	anch.push($(this).text());
                        					    });
                        					    
                        					    $('#ve').val(anch[0]);
                           					    var chart = $("#container7").highcharts();
                           	                	chart.xAxis[0].removePlotLine('vi');
                           	                	chart.xAxis[0].addPlotLine({
                           	                		value: anch[0],
                           	                	    width: 2,
                           	                	    color: 'green',
                           	                	    id: 'vi'
                           	                	});
                           	                	
                        						var anch1=[];
                           					    response.find('div.result1').each(function(){
                           					    	anch1.push($(this).text());
                           					    });
                           					    
                           					    $('#power').val(anch1[0]);
                           					    var chart = $("#container0").highcharts();
                           	                	chart.xAxis[0].removePlotLine('vi');
                           	                	chart.xAxis[0].addPlotLine({
                           	                		value: anch1[0],
                           	                	    width: 2,
                           	                	    color: 'green',
                           	                	    id: 'vi'
                           	                	});
                           	                	var chart = $("#container2").highcharts();
                           	                	chart.xAxis[0].removePlotLine('vi');
                           	                	chart.xAxis[0].addPlotLine({
                           	                		value: anch1[0],
                           	                	    width: 2,
                           	                	    color: 'green',
                           	                	    id: 'vi'
                           	                	});
                           	                	var chart = $("#container3").highcharts();
                           	                	chart.xAxis[0].removePlotLine('vi');
                           	                	chart.xAxis[0].addPlotLine({
                           	                		value: anch1[0],
                           	                	    width: 2,
                           	                	    color: 'green',
                           	                	    id: 'vi'
                           	                	});
                           	                	var chart = $("#container6").highcharts();
                           	                	chart.xAxis[0].removePlotLine('vi');
                           	                	chart.xAxis[0].addPlotLine({
                           	                		value: anch1[0],
                           	                	    width: 2,
                           	                	    color: 'green',
                           	                	    id: 'vi'
                           	                	});
                           	                	var chart = $("#container8").highcharts();
                           	                	chart.xAxis[0].removePlotLine('vi');
                           	                	chart.xAxis[0].addPlotLine({
                           	                		value: anch1[0],
                           	                	    width: 2,
                           	                	    color: 'green',
                           	                	    id: 'vi'
                           	                	});
                           	                	var chart = $("#container9").highcharts();
                           	                	chart.xAxis[0].removePlotLine('vi');
                           	                	chart.xAxis[0].addPlotLine({
                           	                		value: anch1[0],
                           	                	    width: 2,
                           	                	    color: 'green',
                           	                	    id: 'vi'
                           	                	});
                           	                	
                        					},
                        					error: function(){	
                        						alert('Error while request..');
                        					}
                                     	});
                                     	
                             		}
                             	}
                               }
                               
                           }
                       
                       
                       },
                       series: [{
                           name: 'HR',
                           yAxis:1,
                           color: 'rgba(223, 83, 83, .5)',
                           data: graph6
                       },
                       {
                    	   name: 'VCO2',
                           color: 'rgba(23, 33, 183, .5)',
                           data: graph7
                       },
                       {
                   		name: 'VE-2',
                   		lineWidth: 2,
                        marker: {  radius: 3 },
                 		showInLegend: false, 
                 		draggableX: true,
                 		type: 'line',
                         draggableY: true,
                         color: 'rgba(0, 0, 0, .5)',
                           data: [graph7[0],graph7[Math.floor(graph7.length / 2)],graph7[graph7.length -5]],
                           visible:false,
                           point:{
                             	events:{
                             		click:function(){
                             			var chart1 = $("#container5").highcharts();
                                      chart1.series[2].setData([graph7[0],[this.x,this.y],graph7[graph7.length -5]],true);
                             		}
                             	}
                            }
                   	}],
                       navigation: {
                           buttonOptions: {
                               enabled: false
                           }
                       } ,
                       lang: {
                           some_key: 'Polyline',
                           right: 'Right',
                           left: 'Left'
                       },
                       exporting: {
                           buttons: {
                        	   'angle':{
                   				enabled:true,
                   				x:-62,
                   				symbol: 'url(<c:url value="/resources/images/sclae-2.png" />)',
                   				_titleKey: 'some_key',
                   				onclick:function(chart){
                   					var plotline = this.xAxis[0].plotLinesAndBands[0];
                					if(typeof plotline.options.value=='undefined')
                						{
                						alert('select threshold point to active scale');
                						}
                					else
                						{
                						var chart = $('#container5').highcharts(),
                       		            series = chart.series[2];
                       					if(this.series[2].visible){
                       						this.series[2].hide();
                       						series.hide();
                       					}
                       					else{
                       						this.series[2].show();
                       						series.show();
                       					}
                						}
                   					
                   				},
                   			},
                           	'myButton': {
                           		enabled:true,
                               	x: -32,
                               	_titleKey: 'right',
                               	onclick: function (chart) {
                               		var a = $('#power').val();
                             		var chart = $('#container0').highcharts();
                                    chart.xAxis[0].removePlotLine('vi');
                                    chart.xAxis[0].addPlotLine({
                                    	value:+a+1,
                                       	color:'green',
                                       	width:2,
                                       	id:'vi'
                                    });
                                    
                                    var chart = $("#container2").highcharts();
                                   	chart.xAxis[0].removePlotLine('vi');
                                   	chart.xAxis[0].addPlotLine({
                                   		value: +a+1,
                                   	    width: 2,
                                   	    color: 'green',
                                   	    id: 'vi'
                                   	});
                                   	
                                   	var chart = $("#container3").highcharts();
                                   	chart.xAxis[0].removePlotLine('vi');
                                   	chart.xAxis[0].addPlotLine({
                                   		value: +a+1,
                                   	    width: 2,
                                   	    color: 'green',
                                   	    id: 'vi'
                                   	});
                                   	
                                   	var chart = $("#container6").highcharts();
                                   	chart.xAxis[0].removePlotLine('vi');
                                   	chart.xAxis[0].addPlotLine({
                                   		value: +a+1,
                                   	    width: 2,
                                   	    color: 'green',
                                   	    id: 'vi'
                                   	});
                                   	
                                   	var chart = $("#container8").highcharts();
                                   	chart.xAxis[0].removePlotLine('vi');
                                   	chart.xAxis[0].addPlotLine({
                                   		value: +a+1,
                                   	    width: 2,
                                   	    color: 'green',
                                   	    id: 'vi'
                                   	});
                                   	
                                   	var chart = $("#container9").highcharts();
                                   	chart.xAxis[0].removePlotLine('vi');
                                   	chart.xAxis[0].addPlotLine({
                                   		value: +a+1,
                                   	    width: 2,
                                   	    color: 'green',
                                   	    id: 'vi'
                                   	});
                                   	$('#power').val(+a + 1);
                                   	var value= +a +1;
                                   	$.ajax({
                                   		url : 'graphplotTime?id='+(value)+'&tableId='+$('#hiddenValue1').val(),
                       					success : function(data) {
                       						var response=$('<html />').html(data);
                       					    var anch=[];
                       					    response.find('div.result').each(function(){
                       					    	anch.push($(this).text());
                       					    });
                       					 $('#vco2').val(anch[0]);
                    					    var chart = $("#container4").highcharts();
                    	                	chart.xAxis[0].removePlotLine('vi');
                    	                	chart.xAxis[0].addPlotLine({
                    	                		value: anch[0],
                    	                	    width: 2,
                    	                	    color: 'green',
                    	                	    id: 'vi'
                    	                	}); 
                    	                	var anch1=[];
                       					    response.find('div.result1').each(function(){
                       					    	anch1.push($(this).text());
                       					    });
                       					    
                       					    $('#vo2').val(anch1[0]);
                       					    var chart = $("#container5").highcharts();
                       	                	chart.xAxis[0].removePlotLine('vi');
                       	                	chart.xAxis[0].addPlotLine({
                       	                		value: anch1[0],
                       	                	    width: 2,
                       	                	    color: 'green',
                       	                	    id: 'vi'
                       	                	});
                       	                	
                       	                	var anch2=[];
                       					    response.find('div.result2').each(function(){
                       					    	anch2.push($(this).text());
                       					    });
                       					    
                       					 $('#ve').val(anch2[0]);
                       					    var chart = $("#container7").highcharts();
                       	                	chart.xAxis[0].removePlotLine('vi');
                       	                	chart.xAxis[0].addPlotLine({
                       	                		value: anch2[0],
                       	                	    width: 2,
                       	                	    color: 'green',
                       	                	    id: 'vi'
                       	                	});    
                       					},
                       					error: function(){
                       						alert('Error while request..');
                       					}
                                   	});
                               	},
                               	symbol:'url(<c:url value="/resources/images/right.png" />)',
                           	},
                           	'myButton1': {
                           		enabled:true,
                               	x: -2,
                               	_titleKey: 'left',
                               	onclick: function (chart) {
                               		var a = $('#power').val();
                             		var chart = $('#container0').highcharts();
                                    chart.xAxis[0].removePlotLine('vi');
                                    chart.xAxis[0].addPlotLine({
                                    	value:+a-1,
                                       	color:'green',
                                       	width:2,
                                       	id:'vi'
                                    });
                                    var chart = $("#container2").highcharts();
                                   	chart.xAxis[0].removePlotLine('vi');
                                   	chart.xAxis[0].addPlotLine({
                                   		value: +a-1,
                                   	    width: 2,
                                   	    color: 'green',
                                   	    id: 'vi'
                                   	});
                                   	
                                   	var chart = $("#container3").highcharts();
                                   	chart.xAxis[0].removePlotLine('vi');
                                   	chart.xAxis[0].addPlotLine({
                                   		value: +a-1,
                                   	    width: 2,
                                   	    color: 'green',
                                   	    id: 'vi'
                                   	});
                                   	
                                   	var chart = $("#container6").highcharts();
                                   	chart.xAxis[0].removePlotLine('vi');
                                   	chart.xAxis[0].addPlotLine({
                                   		value: +a-1,
                                   	    width: 2,
                                   	    color: 'green',
                                   	    id: 'vi'
                                   	});
                                   	
                                   	var chart = $("#container8").highcharts();
                                   	chart.xAxis[0].removePlotLine('vi');
                                   	chart.xAxis[0].addPlotLine({
                                   		value: +a-1,
                                   	    width: 2,
                                   	    color: 'green',
                                   	    id: 'vi'
                                   	});
                                   	
                                   	var chart = $("#container9").highcharts();
                                   	chart.xAxis[0].removePlotLine('vi');
                                   	chart.xAxis[0].addPlotLine({
                                   		value: +a-1,
                                   	    width: 2,
                                   	    color: 'green',
                                   	    id: 'vi'
                                   	});
                                   	$('#power').val(+a - 1);
                                   	var value= +a -1;
                                   	$.ajax({
                                   		url : 'graphplotTime?id='+(value)+'&tableId='+$('#hiddenValue1').val(),
                       					success : function(data) {
                       						var response=$('<html />').html(data);
                       					    var anch=[];
                       					    response.find('div.result').each(function(){
                       					    	anch.push($(this).text());
                       					    });
                       					 $('#vco2').val(anch[0]);
                    					    var chart = $("#container4").highcharts();
                    	                	chart.xAxis[0].removePlotLine('vi');
                    	                	chart.xAxis[0].addPlotLine({
                    	                		value: anch[0],
                    	                	    width: 2,
                    	                	    color: 'green',
                    	                	    id: 'vi'
                    	                	}); 
                    	                	var anch1=[];
                       					    response.find('div.result1').each(function(){
                       					    	anch1.push($(this).text());
                       					    });
                       					    
                       					    $('#vo2').val(anch1[0]);
                       					    var chart = $("#container5").highcharts();
                       	                	chart.xAxis[0].removePlotLine('vi');
                       	                	chart.xAxis[0].addPlotLine({
                       	                		value: anch1[0],
                       	                	    width: 2,
                       	                	    color: 'green',
                       	                	    id: 'vi'
                       	                	});
                       	                	
                       	                	var anch2=[];
                       					    response.find('div.result2').each(function(){
                       					    	anch2.push($(this).text());
                       					    });
                       					    
                       					 $('#ve').val(anch2[0]);
                       					    var chart = $("#container7").highcharts();
                       	                	chart.xAxis[0].removePlotLine('vi');
                       	                	chart.xAxis[0].addPlotLine({
                       	                		value: anch2[0],
                       	                	    width: 2,
                       	                	    color: 'green',
                       	                	    id: 'vi'
                       	                	});    
                       					},
                       					error: function(){
                       						alert('Error while request..');
                       					}
                                   		
                                   	});
                               	},
                               	symbol:'url(<c:url value="/resources/images/left.png" />)',
                           	}
                           }
                       }
                	
                });
                
                /*Chart-6*/   
                createGraph({
                	credits: {
      			      enabled: false
      			  },
          		
          		tooltip: {
                      crosshairs: true
                  },
                    chart: {
                        renderTo: 'container6',
                        type: 'scatter',
                        events: {}
                    },
                    title: {
                    	text: '6'
                    },
                    xAxis: {
                    	
                        title: {
                            enabled: true,
                            text: 'Power (watt)'
                        },
                        min:0,
                        plotLines: [{
                			id: 'vi',
                            color: 'green',
                            width: 2,
                            value:data1[0] 
                		}],
                        startOnTick: true,
                        endOnTick: true,
                        showLastLabel: true
                    },
                    
                    yAxis: [{
                        title: {
                            text: 'VE/VCO2 (L/min)'
                        },
                        min:0,
                        tickInterval: 8,
                        opposite: true
                    },
                    {
                        title: {
                            text: 'VE/VO2 (L/min)'
                        },
                        min:0,
                        tickInterval: 8
                    }],
                    
                    legend: {
                        layout: 'vertical',
                        align: 'left',
                        verticalAlign: 'top',
                        x: 100,
                        y: 40,
                        floating: true,
                        backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF',
                        borderWidth: 1
                    },
                    tooltip: {
                      	 crosshairs: true,
                   		formatter: function() {
                   			if(this.series.name == 'VE-2'){
                   				return false;	
                   			}
                   			else if(this.series.name == 'VE/VO2')
                   				{
                   				return '<b>'+ this.series.name +'</b><br/>'+
                  				this.point.x+ ' watt,'+ this.point.y.toFixed(2)+' L/min';
                   				
                   				}
                   			else if (this.series.name == 'VE/VCO2'){
                   				return '<b>'+ this.series.name +'</b><br/>'+
                  				this.point.x+ ' watt,'+ this.point.y.toFixed(2)+' L/min';
                   			}
                   		}
               		},
                    plotOptions: {
                        scatter: {
                            marker: {
                                radius: 3,
                                states: {
                                    hover: {
                                        enabled: true,
                                        lineColor: 'rgb(100,100,100)'
                                    }
                                }
                            },
                            states: {
                                hover: {
                                    marker: {
                                        enabled: false
                                    }
                                }
                            },
                           
                        },
                        series: {
                              point:{
                            	events:{
                            		click:function(){
                            			var chart= this.series.chart.xAxis[0];
                                        chart.removePlotLine('vi');
                                        chart.addPlotLine({
                                        	value:this.x,
                                           	color:'green',
                                           	width:2,
                                           	id:'vi'
                                        });
                                        $('#hiddenValue').val(this.x);
                                        $('#power').val(this.x);
                                        $('#ve').val(this.y);
                                           			
                                        var chart = $("#container0").highcharts();
                                       	chart.xAxis[0].removePlotLine('vi');
                                       	chart.xAxis[0].addPlotLine({
                                       		value: this.x,
                                       	    width: 2,
                                       	    color: 'green',
                                       	    id: 'vi'
                                       	});
                                       	
                                       	var chart = $("#container2").highcharts();
                                       	chart.xAxis[0].removePlotLine('vi');
                                       	chart.xAxis[0].addPlotLine({
                                       		value: this.x,
                                       	    width: 2,
                                       	    color: 'green',
                                       	    id: 'vi'
                                       	});
                                       	
                                       	var chart = $("#container3").highcharts();
                                       	chart.xAxis[0].removePlotLine('vi');
                                       	chart.xAxis[0].addPlotLine({
                                       		value: this.x,
                                       	    width: 2,
                                       	    color: 'green',
                                       	    id: 'vi'
                                       	});
                                       	
                                       	var chart = $("#container6").highcharts();
                                       	chart.xAxis[0].removePlotLine('vi');
                                       	chart.xAxis[0].addPlotLine({
                                       		value: this.x,
                                       	    width: 2,
                                       	    color: 'green',
                                       	    id: 'vi'
                                       	});
                                       	
                                       	var chart = $("#container8").highcharts();
                                       	chart.xAxis[0].removePlotLine('vi');
                                       	chart.xAxis[0].addPlotLine({
                                       		value: this.x,
                                       	    width: 2,
                                       	    color: 'green',
                                       	    id: 'vi'
                                       	});
                                       	
                                       	var chart = $("#container9").highcharts();
                                       	chart.xAxis[0].removePlotLine('vi');
                                       	chart.xAxis[0].addPlotLine({
                                       		value: this.x,
                                       	    width: 2,
                                       	    color: 'green',
                                       	    id: 'vi'
                                       	});
                                       	
                                       	$.ajax({
                                       		url : 'graphplotTime?id='+this.x+'&tableId='+$('#hiddenValue1').val(),
                           					success : function(data) {
                           						var response=$('<html />').html(data);
                           					    var anch=[];
                           					    response.find('div.result').each(function(){
                           					    	anch.push($(this).text());
                           					    });
                           					    
                           					    $('#vco2').val(anch[0]);
                           					    var chart = $("#container4").highcharts();
                           	                	chart.xAxis[0].removePlotLine('vi');
                           	                	chart.xAxis[0].addPlotLine({
                           	                		value: anch[0],
                           	                	    width: 2,
                           	                	    color: 'green',
                           	                	    id: 'vi'
                           	                	});
                           	                	
                           	                	var anch1=[];
                           					    response.find('div.result1').each(function(){
                           					    	anch1.push($(this).text());
                           					    });
                           					    
                           					    $('#vo2').val(anch1[0]);
                           					    var chart = $("#container5").highcharts();
                           	                	chart.xAxis[0].removePlotLine('vi');
                           	                	chart.xAxis[0].addPlotLine({
                           	                		value: anch1[0],
                           	                	    width: 2,
                           	                	    color: 'green',
                           	                	    id: 'vi'
                           	                	});
                           	                	
                           	                	var anch2=[];
                           					    response.find('div.result2').each(function(){
                           					    	anch2.push($(this).text());
                           					    });
                           					    
                           					    var chart = $("#container7").highcharts();
                           	                	chart.xAxis[0].removePlotLine('vi');
                           	                	chart.xAxis[0].addPlotLine({
                           	                		value: anch2[0],
                           	                	    width: 2,
                           	                	    color: 'green',
                           	                	    id: 'vi'
                           	                	});
                           					},
                           					error: function(){	
                           						alert('Error while request..');
                           					}
                                       	});
                            		}
                            	}
                            }     
                        }
                    
                    
                    },
                    series: [{
                        name: 'VE/VO2',
                        yAxis:1,
                        color: 'rgba(223, 83, 83, .5)',
                        data: graph8
                    },
                    {
                    	name: 'VE/VCO2',
                        color: 'rgba(176, 143, 23, .5)',
                        data: graph9
                    }],
                    navigation: {
                        buttonOptions: {
                            enabled: false
                        }
                    } ,
                    lang: {
                        right: 'Right',
                        left: 'Left'
                    },
                    exporting: {
                        buttons: {
                        	'myButton': {
                        		enabled:true,
                            	x: -32,
                            	_titleKey: 'right',
                            	onclick: function (chart) {
                					var chart= this.xAxis[0].plotLinesAndBands[0];
                					var a=chart.options.value
                                    this.xAxis[0].removePlotLine('vi');
                                    this.xAxis[0].addPlotLine({
                                    	value:+a + 1,
                                       	color:'green',
                                       	width:2,
                                       	id:'vi'
                                    });
                                    
                                    var chart = $('#container0').highcharts();
                                    chart.xAxis[0].removePlotLine('vi');
                                    chart.xAxis[0].addPlotLine({
                                    	value:+a + 1,
                                       	color:'green',
                                       	width:2,
                                       	id:'vi'
                                    });
                                    
                                    var chart = $("#container2").highcharts();
                                   	chart.xAxis[0].removePlotLine('vi');
                                   	chart.xAxis[0].addPlotLine({
                                   		value: +a + 1,
                                   	    width: 2,
                                   	    color: 'green',
                                   	    id: 'vi'
                                   	});
                                   	
                                   	var chart = $("#container3").highcharts();
                                   	chart.xAxis[0].removePlotLine('vi');
                                   	chart.xAxis[0].addPlotLine({
                                   		value: +a + 1,
                                   	    width: 2,
                                   	    color: 'green',
                                   	    id: 'vi'
                                   	});
                                   	
                                   	var chart = $("#container6").highcharts();
                                   	chart.xAxis[0].removePlotLine('vi');
                                   	chart.xAxis[0].addPlotLine({
                                   		value: +a + 1,
                                   	    width: 2,
                                   	    color: 'green',
                                   	    id: 'vi'
                                   	});
                                   	
                                   	var chart = $("#container8").highcharts();
                                   	chart.xAxis[0].removePlotLine('vi');
                                   	chart.xAxis[0].addPlotLine({
                                   		value: +a + 1,
                                   	    width: 2,
                                   	    color: 'green',
                                   	    id: 'vi'
                                   	});
                                   	
                                   	var chart = $("#container9").highcharts();
                                   	chart.xAxis[0].removePlotLine('vi');
                                   	chart.xAxis[0].addPlotLine({
                                   		value: +a + 1,
                                   	    width: 2,
                                   	    color: 'green',
                                   	    id: 'vi'
                                   	});
                                    
                                    $('#power').val(a);
                                    $.ajax({
                                    	url : 'graphplotTime?id='+(+a + 1)+'&tableId='+$('#hiddenValue1').val(),
                       					success : function(data) {
                       						var response=$('<html />').html(data);
                       					    var anch=[];
                       					    response.find('div.result').each(function(){
                       					    	anch.push($(this).text());
                       					    });
                       					    
                       					    $('#vco2').val(anch[0]);
                       					    var chart = $("#container4").highcharts();
                       	                	chart.xAxis[0].removePlotLine('vi');
                       	                	chart.xAxis[0].addPlotLine({
                       	                		value: anch[0],
                       	                	    width: 2,
                       	                	    color: 'green',
                       	                	    id: 'vi'
                       	                	});
                       	                	
                       	                	var anch1=[];
                       					    response.find('div.result1').each(function(){
                       					    	anch1.push($(this).text());
                       					    });
                       					    
                       					    $('#vo2').val(anch1[0]);
                       					    var chart = $("#container5").highcharts();
                       	                	chart.xAxis[0].removePlotLine('vi');
                       	                	chart.xAxis[0].addPlotLine({
                       	                		value: anch1[0],
                       	                	    width: 2,
                       	                	    color: 'green',
                       	                	    id: 'vi'
                       	                	});
                       	                	
                       	                	var anch2=[];
                       					    response.find('div.result2').each(function(){
                       					    	anch2.push($(this).text());
                       					    });
                       					    
                       					 $('#ve').val(anch2[0]);
                       					    var chart = $("#container7").highcharts();
                       	                	chart.xAxis[0].removePlotLine('vi');
                       	                	chart.xAxis[0].addPlotLine({
                       	                		value: anch2[0],
                       	                	    width: 2,
                       	                	    color: 'green',
                       	                	    id: 'vi'
                       	                	});
                       					},
                       					error: function(){
                       						alert('Error while request..');
                       					}
                                    });
                				},
                            	symbol:'url(<c:url value="/resources/images/right.png" />)',
                        	},
                        	'myButton1': {
                        		enabled:true,
                            	x: -2,
                            	_titleKey: 'left',
                            	onclick: function (chart) {
                					var chart= this.xAxis[0].plotLinesAndBands[0];
                					var a=chart.options.value
                                    this.xAxis[0].removePlotLine('vi');
                                    this.xAxis[0].addPlotLine({
                                    	value:a-1,
                                       	color:'green',
                                       	width:2,
                                       	id:'vi'
                                    });
                                    
                                    var chart = $('#container0').highcharts();
                                    chart.xAxis[0].removePlotLine('vi');
                                    chart.xAxis[0].addPlotLine({
                                    	value:a-1,
                                       	color:'green',
                                       	width:2,
                                       	id:'vi'
                                    });
                                    
                                    var chart = $("#container2").highcharts();
                                   	chart.xAxis[0].removePlotLine('vi');
                                   	chart.xAxis[0].addPlotLine({
                                   		value: a-1,
                                   	    width: 2,
                                   	    color: 'green',
                                   	    id: 'vi'
                                   	});
                                   	
                                   	var chart = $("#container3").highcharts();
                                   	chart.xAxis[0].removePlotLine('vi');
                                   	chart.xAxis[0].addPlotLine({
                                   		value: a-1,
                                   	    width: 2,
                                   	    color: 'green',
                                   	    id: 'vi'
                                   	});
                                   	
                                   	var chart = $("#container6").highcharts();
                                   	chart.xAxis[0].removePlotLine('vi');
                                   	chart.xAxis[0].addPlotLine({
                                   		value: a-1,
                                   	    width: 2,
                                   	    color: 'green',
                                   	    id: 'vi'
                                   	});
                                   	
                                   	var chart = $("#container8").highcharts();
                                   	chart.xAxis[0].removePlotLine('vi');
                                   	chart.xAxis[0].addPlotLine({
                                   		value: a-1,
                                   	    width: 2,
                                   	    color: 'green',
                                   	    id: 'vi'
                                   	});
                                   	
                                   	var chart = $("#container9").highcharts();
                                   	chart.xAxis[0].removePlotLine('vi');
                                   	chart.xAxis[0].addPlotLine({
                                   		value: a-1,
                                   	    width: 2,
                                   	    color: 'green',
                                   	    id: 'vi'
                                   	});
                                    
                                    $('#power').val(a);
                                    $.ajax({
                                    	url : 'graphplotTime?id='+(+a + 1)+'&tableId='+$('#hiddenValue1').val(),
                       					success : function(data) {
                       						var response=$('<html />').html(data);
                       					    var anch=[];
                       					    response.find('div.result').each(function(){
                       					    	anch.push($(this).text());
                       					    });
                       					    
                       					    $('#vco2').val(anch[0]);
                       					    var chart = $("#container4").highcharts();
                       	                	chart.xAxis[0].removePlotLine('vi');
                       	                	chart.xAxis[0].addPlotLine({
                       	                		value: anch[0],
                       	                	    width: 2,
                       	                	    color: 'green',
                       	                	    id: 'vi'
                       	                	});
                       	                	
                       	                	var anch1=[];
                       					    response.find('div.result1').each(function(){
                       					    	anch1.push($(this).text());
                       					    });
                       					    
                       					    $('#vo2').val(anch1[0]);
                       					    var chart = $("#container5").highcharts();
                       	                	chart.xAxis[0].removePlotLine('vi');
                       	                	chart.xAxis[0].addPlotLine({
                       	                		value: anch1[0],
                       	                	    width: 2,
                       	                	    color: 'green',
                       	                	    id: 'vi'
                       	                	});
                       	                	
                       	                	var anch2=[];
                       					    response.find('div.result2').each(function(){
                       					    	anch2.push($(this).text());
                       					    });
                       					    
                       					 $('#ve').val(anch2[0]);
                       					    var chart = $("#container7").highcharts();
                       	                	chart.xAxis[0].removePlotLine('vi');
                       	                	chart.xAxis[0].addPlotLine({
                       	                		value: anch2[0],
                       	                	    width: 2,
                       	                	    color: 'green',
                       	                	    id: 'vi'
                       	                	});
                       					},
                       					error: function(){
                       						alert('Error while request..');
                       					}
                                    });
                				},
                            	symbol:'url(<c:url value="/resources/images/left.png" />)',
                        	}
                        }
                    }
                });
                
                /*Chart-7*/   
                createGraph({
                	credits: {
      			      enabled: false
      			  },
          		
          		tooltip: {
                      crosshairs: true
                  },
                    chart: {
                        renderTo: 'container7',
                        type: 'scatter',
                        events: {}
                    },
                    title: {
                    	text: '7'
                    },
                    xAxis: {
                    	
                        title: {
                            enabled: true,
                            text: 'VE (L/min)'
                        },
                        plotLines: [{
                			id: 'vi',
                            color: 'green',
                            width: 2,
                            value:data2[0] 
                		}],
                        startOnTick: true,
                        endOnTick: true,
                        showLastLabel: true
                    },
                    
                    yAxis: {
                        title: {
                            text: 'VT (L)'
                        },
                    },
                    
                    legend: {
                        layout: 'vertical',
                        align: 'left',
                        verticalAlign: 'top',
                        x: 100,
                        y: 40,
                        floating: true,
                        backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF',
                        borderWidth: 1
                    },
                    tooltip: {
                     	 crosshairs: true,
                  		formatter: function() {
                  			if(this.series.name == 'VE-2'){
                  				return false;	
                  			}
                  			else if(this.series.name == 'VT')
                  				{
                  				return '<b>'+ this.series.name +'</b><br/>'+
                 				this.point.x+ ' L/min,'+ this.point.y.toFixed(2)+' L';
                  				
                  				}
                  			
                  		}
              		},
                    plotOptions: {
                        scatter: {
                            marker: {
                            	radius: 3,
                                states: {
                                    hover: {
                                        enabled: true,
                                        lineColor: 'rgb(100,100,100)'
                                    }
                                }
                            },
                            states: {
                                hover: {
                                    marker: {
                                        enabled: false
                                    }
                                }
                            },
                            
                        },
                        series: {
                            point:{
                            	events:{
                            		click:function(){
                            			var chart= this.series.chart.xAxis[0];
                                        chart.removePlotLine('vi');
                                        chart.addPlotLine({
                                        	value:this.x,
                                           	color:'green',
                                           	width:2,
                                           	id:'vi'
                                        });
                                        
                                        var chart = $("#container7").highcharts();
                	                	chart.xAxis[0].removePlotLine('vi');
                	                	chart.xAxis[0].addPlotLine({
                	                		value: this.x,
                	                	    width: 2,
                	                	    color: 'green',
                	                	    id: 'vi'
                	                	});
                                        $('#ve').val(this.x);
                                        $.ajax({
                                       		url : 'graphplotVE?VE='+this.x+'&VT='+this.y+'&tableId='+$('#hiddenValue1').val(),
                           					success : function(data) {
                           						var response=$('<html />').html(data);
                           					    var anch=[];
                           					    response.find('div.result').each(function(){
                           					    	anch.push($(this).text());
                           					    });
                           					 $('#vo2').val(anch[0]);
                        					    var chart = $("#container5").highcharts();
                        	                	chart.xAxis[0].removePlotLine('vi');
                        	                	chart.xAxis[0].addPlotLine({
                        	                		value: anch[0],
                        	                	    width: 2,
                        	                	    color: 'green',
                        	                	    id: 'vi'
                        	                	});
                        	                	
                        	                	var anch1=[];
                           					    response.find('div.result1').each(function(){
                           					    	anch1.push($(this).text());
                           					    });
                           					    
                           					    $('#vco2').val(anch1[0]);
                           					    var chart = $("#container4").highcharts();
                           	                	chart.xAxis[0].removePlotLine('vi');
                           	                	chart.xAxis[0].addPlotLine({
                           	                		value: anch1[0],
                           	                	    width: 2,
                           	                	    color: 'green',
                           	                	    id: 'vi'
                           	                	});
                           	                	
                           	                	var anch2=[];
                           					    response.find('div.result2').each(function(){
                           					    	anch2.push($(this).text());
                           					    });
                           					    
                           					 $('#power').val(anch2[0]);
                           					    var chart = $("#container0").highcharts();
                           	                	chart.xAxis[0].removePlotLine('vi');
                           	                	chart.xAxis[0].addPlotLine({
                           	                		value: anch2[0],
                           	                	    width: 2,
                           	                	    color: 'green',
                           	                	    id: 'vi'
                           	                	});
                           	                	var chart = $("#container2").highcharts();
                           	                	chart.xAxis[0].removePlotLine('vi');
                           	                	chart.xAxis[0].addPlotLine({
                           	                		value: anch2[0],
                           	                	    width: 2,
                           	                	    color: 'green',
                           	                	    id: 'vi'
                           	                	});
                           	                	var chart = $("#container3").highcharts();
                           	                	chart.xAxis[0].removePlotLine('vi');
                           	                	chart.xAxis[0].addPlotLine({
                           	                		value: anch2[0],
                           	                	    width: 2,
                           	                	    color: 'green',
                           	                	    id: 'vi'
                           	                	});
                           	                	var chart = $("#container6").highcharts();
                           	                	chart.xAxis[0].removePlotLine('vi');
                           	                	chart.xAxis[0].addPlotLine({
                           	                		value: anch2[0],
                           	                	    width: 2,
                           	                	    color: 'green',
                           	                	    id: 'vi'
                           	                	});
                           	                	var chart = $("#container8").highcharts();
                           	                	chart.xAxis[0].removePlotLine('vi');
                           	                	chart.xAxis[0].addPlotLine({
                           	                		value: anch2[0],
                           	                	    width: 2,
                           	                	    color: 'green',
                           	                	    id: 'vi'
                           	                	});
                           	                	var chart = $("#container9").highcharts();
                           	                	chart.xAxis[0].removePlotLine('vi');
                           	                	chart.xAxis[0].addPlotLine({
                           	                		value: anch2[0],
                           	                	    width: 2,
                           	                	    color: 'green',
                           	                	    id: 'vi'
                           	                	});
                           					    
                           					},
                           					error: function(){	
                           						alert('Error while request..');
                           					}
                                       	});    			
                                       
                            		}
                            	}
                            }
                                   
                        }
                    
                    
                    },
                    series: [{
                        name: 'VT',
                        color: 'rgba(223, 83, 83, .5)',
                        data: graph13
                    },
                    {
                 		name: 'VE-2',
                 		lineWidth: 2,
                        marker: {  radius: 3 },
                 		showInLegend: false, 
                 		draggableX: true,
                 		type: 'line',
                         draggableY: true,
                         color: 'rgba(0, 0, 0, .5)',
                         data: [graph13[0],graph13[Math.floor(graph13.length / 2)],graph13[graph13.length -5]],
                         visible:false,
                         point:{
                           	events:{
                           		click:function(){
                           			var chart1 = $("#container7").highcharts();
                                    chart1.series[1].setData([graph13[0],[this.x,this.y],graph13[graph13.length -5]],true);
                           		}
                           	}
                          }
                 	}],
                    navigation: {
                        buttonOptions: {
                            enabled: false
                        }
                    } ,
                    lang: {
                        some_key: 'Polyline',
                        right: 'Right',
                        left: 'Left'
                    },
                    exporting: {
                        buttons: {
                        	'angle':{
                 				enabled:true,
                 				x:-62,
                 				symbol: 'url(<c:url value="/resources/images/sclae-2.png" />)',
                 				_titleKey: 'some_key',
                 				onclick:function(chart){
                 					var plotline = this.xAxis[0].plotLinesAndBands[0];
                					if(typeof plotline.options.value=='undefined')
                						{
                						alert('select threshold point to active scale');
                						}
                					else
                						{
                						var chart = $('#container7').highcharts(),
                     		            series = chart.series[1];
                     					if(this.series[1].visible){
                     						this.series[1].hide();
                     						series.hide();
                     					}
                     					else{
                     						this.series[1].show();
                     						series.show();
                     					}
                						}
                 					
                 				},
                 			},
                        	'myButton': {
                        		enabled:true,
                            	x: -32,
                            	_titleKey: 'right',
                            	onclick: function (chart) {
                            		var a = $('#power').val();
                             		var chart = $('#container0').highcharts();
                                    chart.xAxis[0].removePlotLine('vi');
                                    chart.xAxis[0].addPlotLine({
                                    	value:+a+1,
                                       	color:'green',
                                       	width:2,
                                       	id:'vi'
                                    });
                                    var chart = $("#container2").highcharts();
                                   	chart.xAxis[0].removePlotLine('vi');
                                   	chart.xAxis[0].addPlotLine({
                                   		value: +a+1,
                                   	    width: 2,
                                   	    color: 'green',
                                   	    id: 'vi'
                                   	});
                                   	
                                   	var chart = $("#container3").highcharts();
                                   	chart.xAxis[0].removePlotLine('vi');
                                   	chart.xAxis[0].addPlotLine({
                                   		value: +a+1,
                                   	    width: 2,
                                   	    color: 'green',
                                   	    id: 'vi'
                                   	});
                                   	
                                   	var chart = $("#container6").highcharts();
                                   	chart.xAxis[0].removePlotLine('vi');
                                   	chart.xAxis[0].addPlotLine({
                                   		value: +a+1,
                                   	    width: 2,
                                   	    color: 'green',
                                   	    id: 'vi'
                                   	});
                                   	
                                   	var chart = $("#container8").highcharts();
                                   	chart.xAxis[0].removePlotLine('vi');
                                   	chart.xAxis[0].addPlotLine({
                                   		value: +a+1,
                                   	    width: 2,
                                   	    color: 'green',
                                   	    id: 'vi'
                                   	});
                                   	
                                   	var chart = $("#container9").highcharts();
                                   	chart.xAxis[0].removePlotLine('vi');
                                   	chart.xAxis[0].addPlotLine({
                                   		value: +a+1,
                                   	    width: 2,
                                   	    color: 'green',
                                   	    id: 'vi'
                                   	});
                                   	$('#power').val(+a + 1);
                                   	var value= +a +1;
                                   	$.ajax({
                                   		url : 'graphplotTime?id='+(value)+'&tableId='+$('#hiddenValue1').val(),
                       					success : function(data) {
                       						var response=$('<html />').html(data);
                       					    var anch=[];
                       					    response.find('div.result').each(function(){
                       					    	anch.push($(this).text());
                       					    });
                       					 $('#vco2').val(anch[0]);
                    					    var chart = $("#container4").highcharts();
                    	                	chart.xAxis[0].removePlotLine('vi');
                    	                	chart.xAxis[0].addPlotLine({
                    	                		value: anch[0],
                    	                	    width: 2,
                    	                	    color: 'green',
                    	                	    id: 'vi'
                    	                	}); 
                    	                	var anch1=[];
                       					    response.find('div.result1').each(function(){
                       					    	anch1.push($(this).text());
                       					    });
                       					    
                       					    $('#vo2').val(anch1[0]);
                       					    var chart = $("#container5").highcharts();
                       	                	chart.xAxis[0].removePlotLine('vi');
                       	                	chart.xAxis[0].addPlotLine({
                       	                		value: anch1[0],
                       	                	    width: 2,
                       	                	    color: 'green',
                       	                	    id: 'vi'
                       	                	});
                       	                	
                       	                	var anch2=[];
                       					    response.find('div.result2').each(function(){
                       					    	anch2.push($(this).text());
                       					    });
                       					    
                       					 $('#ve').val(anch2[0]);
                       					    var chart = $("#container7").highcharts();
                       	                	chart.xAxis[0].removePlotLine('vi');
                       	                	chart.xAxis[0].addPlotLine({
                       	                		value: anch2[0],
                       	                	    width: 2,
                       	                	    color: 'green',
                       	                	    id: 'vi'
                       	                	});    
                                   	},
                                   	error: function(){
                   						alert('Error while request..');
                   					}
                                   	});
                            	},
                            	symbol:'url(<c:url value="/resources/images/right.png" />)',
                        	},
                        	'myButton1': {
                        		enabled:true,
                            	x: -2,
                            	_titleKey: 'left',
                            	onclick: function (chart) {
                             		var a = $('#power').val();
                             		var chart = $('#container0').highcharts();
                                    chart.xAxis[0].removePlotLine('vi');
                                    chart.xAxis[0].addPlotLine({
                                    	value:+a-1,
                                       	color:'green',
                                       	width:2,
                                       	id:'vi'
                                    });
                                    
                                    var chart = $("#container2").highcharts();
                                   	chart.xAxis[0].removePlotLine('vi');
                                   	chart.xAxis[0].addPlotLine({
                                   		value: +a-1,
                                   	    width: 2,
                                   	    color: 'green',
                                   	    id: 'vi'
                                   	});
                                   	
                                   	var chart = $("#container3").highcharts();
                                   	chart.xAxis[0].removePlotLine('vi');
                                   	chart.xAxis[0].addPlotLine({
                                   		value: +a-1,
                                   	    width: 2,
                                   	    color: 'green',
                                   	    id: 'vi'
                                   	});
                                   	
                                   	var chart = $("#container6").highcharts();
                                   	chart.xAxis[0].removePlotLine('vi');
                                   	chart.xAxis[0].addPlotLine({
                                   		value: +a-1,
                                   	    width: 2,
                                   	    color: 'green',
                                   	    id: 'vi'
                                   	});
                                   	
                                   	var chart = $("#container8").highcharts();
                                   	chart.xAxis[0].removePlotLine('vi');
                                   	chart.xAxis[0].addPlotLine({
                                   		value: +a-1,
                                   	    width: 2,
                                   	    color: 'green',
                                   	    id: 'vi'
                                   	});
                                   	
                                   	var chart = $("#container9").highcharts();
                                   	chart.xAxis[0].removePlotLine('vi');
                                   	chart.xAxis[0].addPlotLine({
                                   		value: +a-1,
                                   	    width: 2,
                                   	    color: 'green',
                                   	    id: 'vi'
                                   	});
                                   	$('#power').val(+a - 1);
                                   	var value= +a -1;
                                   	$.ajax({
                                   		url : 'graphplotTime?id='+(value)+'&tableId='+$('#hiddenValue1').val(),
                       					success : function(data) {
                       						var response=$('<html />').html(data);
                       					    var anch=[];
                       					    response.find('div.result').each(function(){
                       					    	anch.push($(this).text());
                       					    });
                       					 $('#vco2').val(anch[0]);
                    					    var chart = $("#container4").highcharts();
                    	                	chart.xAxis[0].removePlotLine('vi');
                    	                	chart.xAxis[0].addPlotLine({
                    	                		value: anch[0],
                    	                	    width: 2,
                    	                	    color: 'green',
                    	                	    id: 'vi'
                    	                	}); 
                    	                	var anch1=[];
                       					    response.find('div.result1').each(function(){
                       					    	anch1.push($(this).text());
                       					    });
                       					    
                       					    $('#vo2').val(anch1[0]);
                       					    var chart = $("#container5").highcharts();
                       	                	chart.xAxis[0].removePlotLine('vi');
                       	                	chart.xAxis[0].addPlotLine({
                       	                		value: anch1[0],
                       	                	    width: 2,
                       	                	    color: 'green',
                       	                	    id: 'vi'
                       	                	});
                       	                	
                       	                	var anch2=[];
                       					    response.find('div.result2').each(function(){
                       					    	anch2.push($(this).text());
                       					    });
                       					    
                       					 $('#ve').val(anch2[0]);
                       					    var chart = $("#container7").highcharts();
                       	                	chart.xAxis[0].removePlotLine('vi');
                       	                	chart.xAxis[0].addPlotLine({
                       	                		value: anch2[0],
                       	                	    width: 2,
                       	                	    color: 'green',
                       	                	    id: 'vi'
                       	                	});    
                                   	},
                                   	error: function(){
                   						alert('Error while request..');
                   					}
                                   	});
                             	},
                            	symbol:'url(<c:url value="/resources/images/left.png" />)',
                        	}
                        }
                    }
                });
                
                /*Chart-8*/   
                createGraph({
                	credits: {
      			      enabled: false
      			  },
          		
          		tooltip: {
                      crosshairs: true
                  },
                    chart: {
                        renderTo: 'container8',
                        type: 'scatter',
                        events: {}
                    },
                    title: {
                    	text: '8'
                    },
                    xAxis: {
                    	
                        title: {
                            enabled: true,
                            text: 'Power (watt)'
                        },
                        min:0,
                        plotLines: [{
                			id: 'vi',
                            color: 'green',
                            width: 2,
                            value:data1[0] 
                		}],
                        startOnTick: true,
                        endOnTick: true,
                        showLastLabel: true
                    },
                    
                    yAxis: {
                        title: {
                            text: 'RER'
                        },
                        min:0
                    },
                    
                    legend: {
                        layout: 'vertical',
                        align: 'left',
                        verticalAlign: 'top',
                        x: 100,
                        y: 40,
                        floating: true,
                        backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF',
                        borderWidth: 1
                    },
                    tooltip: {
                     	 crosshairs: true,
                  		formatter: function() {
                  			if(this.series.name == 'VE-2'){
                  				return false;	
                  			}
                  			else if(this.series.name == 'RER')
                  				{
                  				return '<b>'+ this.series.name +'</b><br/>'+
                 				this.point.x+ ' watt,'+ this.point.y.toFixed(2);
                  				
                  				}
                  			
                  		}
              		},
                    plotOptions: {
                        scatter: {
                            marker: {
                            	radius: 3,
                                states: {
                                    hover: {
                                        enabled: true,
                                        lineColor: 'rgb(100,100,100)'
                                    }
                                }
                            },
                            states: {
                                hover: {
                                    marker: {
                                        enabled: false
                                    }
                                }
                            },
                           
                        },
                        series: {
                              point:{
                            	events:{
                            		click:function(){
                            			var chart= this.series.chart.xAxis[0];
                                        chart.removePlotLine('vi');
                                        chart.addPlotLine({
                                        	value:this.x,
                                           	color:'green',
                                           	width:2,
                                           	id:'vi'
                                        });
                                        $('#hiddenValue').val(this.x);
                                        $('#power').val(this.x);
                                        $('#ve').val(this.y);
                                           			
                                        var chart = $("#container0").highcharts();
                                       	chart.xAxis[0].removePlotLine('vi');
                                       	chart.xAxis[0].addPlotLine({
                                       		value: this.x,
                                       	    width: 2,
                                       	    color: 'green',
                                       	    id: 'vi'
                                       	});
                                       	
                                       	var chart = $("#container2").highcharts();
                                       	chart.xAxis[0].removePlotLine('vi');
                                       	chart.xAxis[0].addPlotLine({
                                       		value: this.x,
                                       	    width: 2,
                                       	    color: 'green',
                                       	    id: 'vi'
                                       	});
                                       	
                                       	var chart = $("#container3").highcharts();
                                       	chart.xAxis[0].removePlotLine('vi');
                                       	chart.xAxis[0].addPlotLine({
                                       		value: this.x,
                                       	    width: 2,
                                       	    color: 'green',
                                       	    id: 'vi'
                                       	});
                                       	
                                       	var chart = $("#container6").highcharts();
                                       	chart.xAxis[0].removePlotLine('vi');
                                       	chart.xAxis[0].addPlotLine({
                                       		value: this.x,
                                       	    width: 2,
                                       	    color: 'green',
                                       	    id: 'vi'
                                       	});
                                       	
                                       	var chart = $("#container8").highcharts();
                                       	chart.xAxis[0].removePlotLine('vi');
                                       	chart.xAxis[0].addPlotLine({
                                       		value: this.x,
                                       	    width: 2,
                                       	    color: 'green',
                                       	    id: 'vi'
                                       	});
                                       	
                                       	var chart = $("#container9").highcharts();
                                       	chart.xAxis[0].removePlotLine('vi');
                                       	chart.xAxis[0].addPlotLine({
                                       		value: this.x,
                                       	    width: 2,
                                       	    color: 'green',
                                       	    id: 'vi'
                                       	});
                                       	
                                       	$.ajax({
                                       		url : 'graphplotTime?id='+this.x+'&tableId='+$('#hiddenValue1').val(),
                           					success : function(data) {
                           						var response=$('<html />').html(data);
                           					    var anch=[];
                           					    response.find('div.result').each(function(){
                           					    	anch.push($(this).text());
                           					    });
                           					    
                           					    $('#vco2').val(anch[0]);
                           					    var chart = $("#container4").highcharts();
                           	                	chart.xAxis[0].removePlotLine('vi');
                           	                	chart.xAxis[0].addPlotLine({
                           	                		value: anch[0],
                           	                	    width: 2,
                           	                	    color: 'green',
                           	                	    id: 'vi'
                           	                	});
                           	                	
                           	                	var anch1=[];
                           					    response.find('div.result1').each(function(){
                           					    	anch1.push($(this).text());
                           					    });
                           					    
                           					    $('#vo2').val(anch1[0]);
                           					    var chart = $("#container5").highcharts();
                           	                	chart.xAxis[0].removePlotLine('vi');
                           	                	chart.xAxis[0].addPlotLine({
                           	                		value: anch1[0],
                           	                	    width: 2,
                           	                	    color: 'green',
                           	                	    id: 'vi'
                           	                	});
                           	                	
                           	                	var anch2=[];
                           					    response.find('div.result2').each(function(){
                           					    	anch2.push($(this).text());
                           					    });
                           					    
                           					    var chart = $("#container7").highcharts();
                           	                	chart.xAxis[0].removePlotLine('vi');
                           	                	chart.xAxis[0].addPlotLine({
                           	                		value: anch2[0],
                           	                	    width: 2,
                           	                	    color: 'green',
                           	                	    id: 'vi'
                           	                	});
                           					},
                           					error: function(){	
                           						alert('Error while request..');
                           					}
                                       	});
                            		}
                            	}
                            }     
                        }
                    
                    
                    },
                    series: [{
                        name: 'RER',
                        color: 'rgba(223, 83, 83, .5)',
                        data: graph10
                    },
                    {
                 		name: 'VE-2',
                 		lineWidth: 2,
                        marker: {  radius: 3 },
                 		showInLegend: false, 
                 		draggableX: true,
                 		type: 'line',
                         draggableY: true,
                         color: 'rgba(0, 0, 0, .5)',
                         data: [graph10[0],graph10[Math.floor(graph10.length / 2)],graph10[graph10.length -5]],
                         visible:false,
                         point:{
                           	events:{
                           		click:function(){
                           			var chart1 = $("#container8").highcharts();
                                    chart1.series[1].setData([graph10[0],[this.x,this.y],graph10[graph10.length -5]],true);
                           		}
                           	}
                          }
                 	}],
                    navigation: {
                        buttonOptions: {
                            enabled: false
                        }
                    } ,
                    lang: {
                        some_key: 'Polyline',
                        right: 'Right',
                        left: 'Left'
                    },
                    exporting: {
                        buttons: {
                        	'angle':{
                 				enabled:true,
                 				x:-62,
                 				symbol: 'url(<c:url value="/resources/images/sclae-2.png" />)',
                 				_titleKey: 'some_key',
                 				onclick:function(chart){
                 					var plotline = this.xAxis[0].plotLinesAndBands[0];
                					if(typeof plotline.options.value=='undefined')
                						{
                						alert('select threshold point to active scale');
                						}
                					else
                						{
                						var chart = $('#container8').highcharts(),
                     		            series = chart.series[1];
                     					if(this.series[1].visible){
                     						this.series[1].hide();
                     						series.hide();
                     					}
                     					else{
                     						this.series[1].show();
                     						series.show();
                     					}
                						}
                 					
                 				},
                 			},
                        	'myButton': {
                        		enabled:true,
                            	x: -32,
                            	_titleKey: 'right',
                            	onclick: function (chart) {
                					var chart= this.xAxis[0].plotLinesAndBands[0];
                					var a=chart.options.value
                                    this.xAxis[0].removePlotLine('vi');
                                    this.xAxis[0].addPlotLine({
                                    	value:+a + 1,
                                       	color:'green',
                                       	width:2,
                                       	id:'vi'
                                    });
                                    
                                    var chart = $('#container0').highcharts();
                                    chart.xAxis[0].removePlotLine('vi');
                                    chart.xAxis[0].addPlotLine({
                                    	value:+a + 1,
                                       	color:'green',
                                       	width:2,
                                       	id:'vi'
                                    });
                                    
                                    var chart = $("#container2").highcharts();
                                   	chart.xAxis[0].removePlotLine('vi');
                                   	chart.xAxis[0].addPlotLine({
                                   		value: +a + 1,
                                   	    width: 2,
                                   	    color: 'green',
                                   	    id: 'vi'
                                   	});
                                   	
                                   	var chart = $("#container3").highcharts();
                                   	chart.xAxis[0].removePlotLine('vi');
                                   	chart.xAxis[0].addPlotLine({
                                   		value: +a + 1,
                                   	    width: 2,
                                   	    color: 'green',
                                   	    id: 'vi'
                                   	});
                                   	
                                   	var chart = $("#container6").highcharts();
                                   	chart.xAxis[0].removePlotLine('vi');
                                   	chart.xAxis[0].addPlotLine({
                                   		value: +a + 1,
                                   	    width: 2,
                                   	    color: 'green',
                                   	    id: 'vi'
                                   	});
                                   	
                                   	var chart = $("#container8").highcharts();
                                   	chart.xAxis[0].removePlotLine('vi');
                                   	chart.xAxis[0].addPlotLine({
                                   		value: +a + 1,
                                   	    width: 2,
                                   	    color: 'green',
                                   	    id: 'vi'
                                   	});
                                   	
                                   	var chart = $("#container9").highcharts();
                                   	chart.xAxis[0].removePlotLine('vi');
                                   	chart.xAxis[0].addPlotLine({
                                   		value: +a + 1,
                                   	    width: 2,
                                   	    color: 'green',
                                   	    id: 'vi'
                                   	});
                                    
                                    $('#power').val(a);
                                    $.ajax({
                                    	url : 'graphplotTime?id='+(+a + 1)+'&tableId='+$('#hiddenValue1').val(),
                       					success : function(data) {
                       						var response=$('<html />').html(data);
                       					    var anch=[];
                       					    response.find('div.result').each(function(){
                       					    	anch.push($(this).text());
                       					    });
                       					    
                       					    $('#vco2').val(anch[0]);
                       					    var chart = $("#container4").highcharts();
                       	                	chart.xAxis[0].removePlotLine('vi');
                       	                	chart.xAxis[0].addPlotLine({
                       	                		value: anch[0],
                       	                	    width: 2,
                       	                	    color: 'green',
                       	                	    id: 'vi'
                       	                	});
                       	                	
                       	                	var anch1=[];
                       					    response.find('div.result1').each(function(){
                       					    	anch1.push($(this).text());
                       					    });
                       					    
                       					    $('#vo2').val(anch1[0]);
                       					    var chart = $("#container5").highcharts();
                       	                	chart.xAxis[0].removePlotLine('vi');
                       	                	chart.xAxis[0].addPlotLine({
                       	                		value: anch1[0],
                       	                	    width: 2,
                       	                	    color: 'green',
                       	                	    id: 'vi'
                       	                	});
                       	                	
                       	                	var anch2=[];
                       					    response.find('div.result2').each(function(){
                       					    	anch2.push($(this).text());
                       					    });
                       					    
                       					 $('#ve').val(anch2[0]);
                       					    var chart = $("#container7").highcharts();
                       	                	chart.xAxis[0].removePlotLine('vi');
                       	                	chart.xAxis[0].addPlotLine({
                       	                		value: anch2[0],
                       	                	    width: 2,
                       	                	    color: 'green',
                       	                	    id: 'vi'
                       	                	});
                       					},
                       					error: function(){
                       						alert('Error while request..');
                       					}
                                    });
                				},
                            	symbol:'url(<c:url value="/resources/images/right.png" />)',
                        	},
                        	'myButton1': {
                        		enabled:true,
                            	x: -2,
                            	_titleKey: 'left',
                            	onclick: function (chart) {
                					var chart= this.xAxis[0].plotLinesAndBands[0];
                					var a=chart.options.value
                                    this.xAxis[0].removePlotLine('vi');
                                    this.xAxis[0].addPlotLine({
                                    	value:a-1,
                                       	color:'green',
                                       	width:2,
                                       	id:'vi'
                                    });
                                    
                                    var chart = $('#container0').highcharts();
                                    chart.xAxis[0].removePlotLine('vi');
                                    chart.xAxis[0].addPlotLine({
                                    	value:a-1,
                                       	color:'green',
                                       	width:2,
                                       	id:'vi'
                                    });
                                    
                                    var chart = $("#container2").highcharts();
                                   	chart.xAxis[0].removePlotLine('vi');
                                   	chart.xAxis[0].addPlotLine({
                                   		value: a-1,
                                   	    width: 2,
                                   	    color: 'green',
                                   	    id: 'vi'
                                   	});
                                   	
                                   	var chart = $("#container3").highcharts();
                                   	chart.xAxis[0].removePlotLine('vi');
                                   	chart.xAxis[0].addPlotLine({
                                   		value: a-1,
                                   	    width: 2,
                                   	    color: 'green',
                                   	    id: 'vi'
                                   	});
                                   	
                                   	var chart = $("#container6").highcharts();
                                   	chart.xAxis[0].removePlotLine('vi');
                                   	chart.xAxis[0].addPlotLine({
                                   		value: a-1,
                                   	    width: 2,
                                   	    color: 'green',
                                   	    id: 'vi'
                                   	});
                                   	
                                   	var chart = $("#container8").highcharts();
                                   	chart.xAxis[0].removePlotLine('vi');
                                   	chart.xAxis[0].addPlotLine({
                                   		value: a-1,
                                   	    width: 2,
                                   	    color: 'green',
                                   	    id: 'vi'
                                   	});
                                   	
                                   	var chart = $("#container9").highcharts();
                                   	chart.xAxis[0].removePlotLine('vi');
                                   	chart.xAxis[0].addPlotLine({
                                   		value: a-1,
                                   	    width: 2,
                                   	    color: 'green',
                                   	    id: 'vi'
                                   	});
                                    
                                    $('#power').val(a);
                                    $.ajax({
                                    	url : 'graphplotTime?id='+(+a + 1)+'&tableId='+$('#hiddenValue1').val(),
                       					success : function(data) {
                       						var response=$('<html />').html(data);
                       					    var anch=[];
                       					    response.find('div.result').each(function(){
                       					    	anch.push($(this).text());
                       					    });
                       					    
                       					    $('#vco2').val(anch[0]);
                       					    var chart = $("#container4").highcharts();
                       	                	chart.xAxis[0].removePlotLine('vi');
                       	                	chart.xAxis[0].addPlotLine({
                       	                		value: anch[0],
                       	                	    width: 2,
                       	                	    color: 'green',
                       	                	    id: 'vi'
                       	                	});
                       	                	
                       	                	var anch1=[];
                       					    response.find('div.result1').each(function(){
                       					    	anch1.push($(this).text());
                       					    });
                       					    
                       					    $('#vo2').val(anch1[0]);
                       					    var chart = $("#container5").highcharts();
                       	                	chart.xAxis[0].removePlotLine('vi');
                       	                	chart.xAxis[0].addPlotLine({
                       	                		value: anch1[0],
                       	                	    width: 2,
                       	                	    color: 'green',
                       	                	    id: 'vi'
                       	                	});
                       	                	
                       	                	var anch2=[];
                       					    response.find('div.result2').each(function(){
                       					    	anch2.push($(this).text());
                       					    });
                       					    
                       					 $('#ve').val(anch2[0]);
                       					    var chart = $("#container7").highcharts();
                       	                	chart.xAxis[0].removePlotLine('vi');
                       	                	chart.xAxis[0].addPlotLine({
                       	                		value: anch2[0],
                       	                	    width: 2,
                       	                	    color: 'green',
                       	                	    id: 'vi'
                       	                	});
                       					},
                       					error: function(){
                       						alert('Error while request..');
                       					}
                                    });
                				},
                            	symbol:'url(<c:url value="/resources/images/left.png" />)',
                        	}
                        }
                    }
                });
                
                /*Chart-9*/   
                createGraph({
                	credits: {
      			      enabled: false
      			  },
          		
          		tooltip: {
                      crosshairs: true
                  },
                    chart: {
                        renderTo: 'container9',
                        type: 'scatter',
                        events: {}
                    },
                    title: {
                    	text: '9'
                    },
                    xAxis: {
                    	
                        title: {
                            enabled: true,
                            text: 'Power (watt)'
                        },
                        min:0,
                        plotLines: [{
                			id: 'vi',
                            color: 'green',
                            width: 2,
                            value:data1[0] 
                		}],
                        startOnTick: true,
                        endOnTick: true,
                        showLastLabel: true
                    },
                    
                    yAxis: {
                        title: {
                            text: 'mm Hg'
                        },
                        min:0,
                        tickInterval: 15
                    },
                    
                    legend: {
                        layout: 'vertical',
                        align: 'left',
                        verticalAlign: 'top',
                        x: 100,
                        y: 40,
                        floating: true,
                        backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF',
                        borderWidth: 1
                    },
                    tooltip: {
                     	 crosshairs: true,
                  		formatter: function() {
                  			if(this.series.name == 'VE-2'){
                  				return false;	
                  			}
                  			else if(this.series.name == 'PETO2')
                  				{
                  				return '<b>'+ this.series.name +'</b><br/>'+
                 				this.point.x+ ' watt,'+ this.point.y+' mm Hg';
                  				
                  				}
                  			else if (this.series.name == 'PETCO2'){
                  				return '<b>'+ this.series.name +'</b><br/>'+
                 				this.point.x+ ' watt,'+ this.point.y+' mm Hg';
                  			}
                  		}
              		},
                    plotOptions: {
                        scatter: {
                            marker: {
                            	radius: 3,
                                states: {
                                    hover: {
                                        enabled: true,
                                        lineColor: 'rgb(100,100,100)'
                                    }
                                }
                            },
                            states: {
                                hover: {
                                    marker: {
                                        enabled: false
                                    }
                                }
                            },
                           
                        },
                        series: {
                              point:{
                            	events:{
                            		click:function(){
                            			var chart= this.series.chart.xAxis[0];
                                        chart.removePlotLine('vi');
                                        chart.addPlotLine({
                                        	value:this.x,
                                           	color:'green',
                                           	width:2,
                                           	id:'vi'
                                        });
                                        $('#hiddenValue').val(this.x);
                                        $('#power').val(this.x);
                                        $('#ve').val(this.y);
                                           			
                                        var chart = $("#container0").highcharts();
                                       	chart.xAxis[0].removePlotLine('vi');
                                       	chart.xAxis[0].addPlotLine({
                                       		value: this.x,
                                       	    width: 2,
                                       	    color: 'green',
                                       	    id: 'vi'
                                       	});
                                       	
                                       	var chart = $("#container2").highcharts();
                                       	chart.xAxis[0].removePlotLine('vi');
                                       	chart.xAxis[0].addPlotLine({
                                       		value: this.x,
                                       	    width: 2,
                                       	    color: 'green',
                                       	    id: 'vi'
                                       	});
                                       	
                                       	var chart = $("#container3").highcharts();
                                       	chart.xAxis[0].removePlotLine('vi');
                                       	chart.xAxis[0].addPlotLine({
                                       		value: this.x,
                                       	    width: 2,
                                       	    color: 'green',
                                       	    id: 'vi'
                                       	});
                                       	
                                       	var chart = $("#container6").highcharts();
                                       	chart.xAxis[0].removePlotLine('vi');
                                       	chart.xAxis[0].addPlotLine({
                                       		value: this.x,
                                       	    width: 2,
                                       	    color: 'green',
                                       	    id: 'vi'
                                       	});
                                       	
                                       	var chart = $("#container8").highcharts();
                                       	chart.xAxis[0].removePlotLine('vi');
                                       	chart.xAxis[0].addPlotLine({
                                       		value: this.x,
                                       	    width: 2,
                                       	    color: 'green',
                                       	    id: 'vi'
                                       	});
                                       	
                                       	var chart = $("#container9").highcharts();
                                       	chart.xAxis[0].removePlotLine('vi');
                                       	chart.xAxis[0].addPlotLine({
                                       		value: this.x,
                                       	    width: 2,
                                       	    color: 'green',
                                       	    id: 'vi'
                                       	});
                                       	
                                       	$.ajax({
                                       		url : 'graphplotTime?id='+this.x+'&tableId='+$('#hiddenValue1').val(),
                           					success : function(data) {
                           						var response=$('<html />').html(data);
                           					    var anch=[];
                           					    response.find('div.result').each(function(){
                           					    	anch.push($(this).text());
                           					    });
                           					    
                           					    $('#vco2').val(anch[0]);
                           					    var chart = $("#container4").highcharts();
                           	                	chart.xAxis[0].removePlotLine('vi');
                           	                	chart.xAxis[0].addPlotLine({
                           	                		value: anch[0],
                           	                	    width: 2,
                           	                	    color: 'green',
                           	                	    id: 'vi'
                           	                	});
                           	                	
                           	                	var anch1=[];
                           					    response.find('div.result1').each(function(){
                           					    	anch1.push($(this).text());
                           					    });
                           					    
                           					    $('#vo2').val(anch1[0]);
                           					    var chart = $("#container5").highcharts();
                           	                	chart.xAxis[0].removePlotLine('vi');
                           	                	chart.xAxis[0].addPlotLine({
                           	                		value: anch1[0],
                           	                	    width: 2,
                           	                	    color: 'green',
                           	                	    id: 'vi'
                           	                	});
                           	                	
                           	                	var anch2=[];
                           					    response.find('div.result2').each(function(){
                           					    	anch2.push($(this).text());
                           					    });
                           					    
                           					    var chart = $("#container7").highcharts();
                           	                	chart.xAxis[0].removePlotLine('vi');
                           	                	chart.xAxis[0].addPlotLine({
                           	                		value: anch2[0],
                           	                	    width: 2,
                           	                	    color: 'green',
                           	                	    id: 'vi'
                           	                	});
                           					},
                           					error: function(){	
                           						alert('Error while request..');
                           					}
                                       	});
                            		}
                            	}
                            }     
                        }
                    
                    
                    },
                    series: [{
                        name: 'PETO2',
                        color: 'rgba(223, 83, 83, .5)',
                        data: graph11
                    },
                    {
                    	name: 'PETCO2',
                        color: 'rgba(23, 183, 183, .5)',
                        data: graph12
                    },
                    {
                 		name: 'VE-2',
                 		lineWidth: 2,
                        marker: {  radius: 3 },
                 		showInLegend: false, 
                 		draggableX: true,
                 		type: 'line',
                         draggableY: true,
                         color: 'rgba(0, 0, 0, .5)',
                         data: [graph12[0],graph12[Math.floor(graph12.length / 2)],graph12[graph12.length -5]],
                         visible:false,
                         point:{
                           	events:{
                           		click:function(){
                           			var chart1 = $("#container9").highcharts();
                                    chart1.series[2].setData([graph12[0],[this.x,this.y],graph12[graph12.length -5]],true);
                           		}
                           	}
                          }
                 	}],
                    navigation: {
                        buttonOptions: {
                            enabled: false
                        }
                    } ,
                    lang: {
                        some_key: 'Polyline',
                        right: 'Right',
                        left: 'Left'
                    },
                    exporting: {
                        buttons: {
                        	'angle':{
                 				enabled:true,
                 				x:-62,
                 				symbol: 'url(<c:url value="/resources/images/sclae-2.png" />)',
                 				_titleKey: 'some_key',
                 				onclick:function(chart){
                 					var plotline = this.xAxis[0].plotLinesAndBands[0];
                					if(typeof plotline.options.value=='undefined')
                						{
                						alert('select threshold point to active scale');
                						}
                					else
                						{
                						var chart = $('#container9').highcharts(),
                     		            series = chart.series[2];
                     					if(this.series[2].visible){
                     						this.series[2].hide();
                     						series.hide();
                     					}
                     					else{
                     						this.series[2].show();
                     						series.show();
                     					}
                						}
                 					
                 				},
                 			},
                        	'myButton': {
                        		enabled:true,
                            	x: -32,
                            	_titleKey: 'right',
                            	onclick: function (chart) {
                					var chart= this.xAxis[0].plotLinesAndBands[0];
                					var a=chart.options.value
                                    this.xAxis[0].removePlotLine('vi');
                                    this.xAxis[0].addPlotLine({
                                    	value:+a + 1,
                                       	color:'green',
                                       	width:2,
                                       	id:'vi'
                                    });
                                    
                                    var chart = $('#container0').highcharts();
                                    chart.xAxis[0].removePlotLine('vi');
                                    chart.xAxis[0].addPlotLine({
                                    	value:+a + 1,
                                       	color:'green',
                                       	width:2,
                                       	id:'vi'
                                    });
                                    
                                    var chart = $("#container2").highcharts();
                                   	chart.xAxis[0].removePlotLine('vi');
                                   	chart.xAxis[0].addPlotLine({
                                   		value: +a + 1,
                                   	    width: 2,
                                   	    color: 'green',
                                   	    id: 'vi'
                                   	});
                                   	
                                   	var chart = $("#container3").highcharts();
                                   	chart.xAxis[0].removePlotLine('vi');
                                   	chart.xAxis[0].addPlotLine({
                                   		value: +a + 1,
                                   	    width: 2,
                                   	    color: 'green',
                                   	    id: 'vi'
                                   	});
                                   	
                                   	var chart = $("#container6").highcharts();
                                   	chart.xAxis[0].removePlotLine('vi');
                                   	chart.xAxis[0].addPlotLine({
                                   		value: +a + 1,
                                   	    width: 2,
                                   	    color: 'green',
                                   	    id: 'vi'
                                   	});
                                   	
                                   	var chart = $("#container8").highcharts();
                                   	chart.xAxis[0].removePlotLine('vi');
                                   	chart.xAxis[0].addPlotLine({
                                   		value: +a + 1,
                                   	    width: 2,
                                   	    color: 'green',
                                   	    id: 'vi'
                                   	});
                                   	
                                   	var chart = $("#container9").highcharts();
                                   	chart.xAxis[0].removePlotLine('vi');
                                   	chart.xAxis[0].addPlotLine({
                                   		value: +a + 1,
                                   	    width: 2,
                                   	    color: 'green',
                                   	    id: 'vi'
                                   	});
                                    
                                    $('#power').val(a);
                                    $.ajax({
                                    	url : 'graphplotTime?id='+(+a + 1)+'&tableId='+$('#hiddenValue1').val(),
                       					success : function(data) {
                       						var response=$('<html />').html(data);
                       					    var anch=[];
                       					    response.find('div.result').each(function(){
                       					    	anch.push($(this).text());
                       					    });
                       					    
                       					    $('#vco2').val(anch[0]);
                       					    var chart = $("#container4").highcharts();
                       	                	chart.xAxis[0].removePlotLine('vi');
                       	                	chart.xAxis[0].addPlotLine({
                       	                		value: anch[0],
                       	                	    width: 2,
                       	                	    color: 'green',
                       	                	    id: 'vi'
                       	                	});
                       	                	
                       	                	var anch1=[];
                       					    response.find('div.result1').each(function(){
                       					    	anch1.push($(this).text());
                       					    });
                       					    
                       					    $('#vo2').val(anch1[0]);
                       					    var chart = $("#container5").highcharts();
                       	                	chart.xAxis[0].removePlotLine('vi');
                       	                	chart.xAxis[0].addPlotLine({
                       	                		value: anch1[0],
                       	                	    width: 2,
                       	                	    color: 'green',
                       	                	    id: 'vi'
                       	                	});
                       	                	
                       	                	var anch2=[];
                       					    response.find('div.result2').each(function(){
                       					    	anch2.push($(this).text());
                       					    });
                       					    
                       					 $('#ve').val(anch2[0]);
                       					    var chart = $("#container7").highcharts();
                       	                	chart.xAxis[0].removePlotLine('vi');
                       	                	chart.xAxis[0].addPlotLine({
                       	                		value: anch2[0],
                       	                	    width: 2,
                       	                	    color: 'green',
                       	                	    id: 'vi'
                       	                	});
                       					},
                       					error: function(){
                       						alert('Error while request..');
                       					}
                                    });
                				},
                            	symbol:'url(<c:url value="/resources/images/right.png" />)',
                        	},
                        	'myButton1': {
                        		enabled:true,
                            	x: -2,
                            	_titleKey: 'left',
                            	onclick: function (chart) {
                					var chart= this.xAxis[0].plotLinesAndBands[0];
                					var a=chart.options.value
                                    this.xAxis[0].removePlotLine('vi');
                                    this.xAxis[0].addPlotLine({
                                    	value:a-1,
                                       	color:'green',
                                       	width:2,
                                       	id:'vi'
                                    });
                                    
                                    var chart = $('#container0').highcharts();
                                    chart.xAxis[0].removePlotLine('vi');
                                    chart.xAxis[0].addPlotLine({
                                    	value:a-1,
                                       	color:'green',
                                       	width:2,
                                       	id:'vi'
                                    });
                                    
                                    var chart = $("#container2").highcharts();
                                   	chart.xAxis[0].removePlotLine('vi');
                                   	chart.xAxis[0].addPlotLine({
                                   		value: a-1,
                                   	    width: 2,
                                   	    color: 'green',
                                   	    id: 'vi'
                                   	});
                                   	
                                   	var chart = $("#container3").highcharts();
                                   	chart.xAxis[0].removePlotLine('vi');
                                   	chart.xAxis[0].addPlotLine({
                                   		value: a-1,
                                   	    width: 2,
                                   	    color: 'green',
                                   	    id: 'vi'
                                   	});
                                   	
                                   	var chart = $("#container6").highcharts();
                                   	chart.xAxis[0].removePlotLine('vi');
                                   	chart.xAxis[0].addPlotLine({
                                   		value: a-1,
                                   	    width: 2,
                                   	    color: 'green',
                                   	    id: 'vi'
                                   	});
                                   	
                                   	var chart = $("#container8").highcharts();
                                   	chart.xAxis[0].removePlotLine('vi');
                                   	chart.xAxis[0].addPlotLine({
                                   		value: a-1,
                                   	    width: 2,
                                   	    color: 'green',
                                   	    id: 'vi'
                                   	});
                                   	
                                   	var chart = $("#container9").highcharts();
                                   	chart.xAxis[0].removePlotLine('vi');
                                   	chart.xAxis[0].addPlotLine({
                                   		value: a-1,
                                   	    width: 2,
                                   	    color: 'green',
                                   	    id: 'vi'
                                   	});
                                    
                                    $('#power').val(a);
                                    $.ajax({
                                    	url : 'graphplotTime?id='+(+a + 1)+'&tableId='+$('#hiddenValue1').val(),
                       					success : function(data) {
                       						var response=$('<html />').html(data);
                       					    var anch=[];
                       					    response.find('div.result').each(function(){
                       					    	anch.push($(this).text());
                       					    });
                       					    
                       					    $('#vco2').val(anch[0]);
                       					    var chart = $("#container4").highcharts();
                       	                	chart.xAxis[0].removePlotLine('vi');
                       	                	chart.xAxis[0].addPlotLine({
                       	                		value: anch[0],
                       	                	    width: 2,
                       	                	    color: 'green',
                       	                	    id: 'vi'
                       	                	});
                       	                	
                       	                	var anch1=[];
                       					    response.find('div.result1').each(function(){
                       					    	anch1.push($(this).text());
                       					    });
                       					    
                       					    $('#vo2').val(anch1[0]);
                       					    var chart = $("#container5").highcharts();
                       	                	chart.xAxis[0].removePlotLine('vi');
                       	                	chart.xAxis[0].addPlotLine({
                       	                		value: anch1[0],
                       	                	    width: 2,
                       	                	    color: 'green',
                       	                	    id: 'vi'
                       	                	});
                       	                	
                       	                	var anch2=[];
                       					    response.find('div.result2').each(function(){
                       					    	anch2.push($(this).text());
                       					    });
                       					    
                       					 $('#ve').val(anch2[0]);
                       					    var chart = $("#container7").highcharts();
                       	                	chart.xAxis[0].removePlotLine('vi');
                       	                	chart.xAxis[0].addPlotLine({
                       	                		value: anch2[0],
                       	                	    width: 2,
                       	                	    color: 'green',
                       	                	    id: 'vi'
                       	                	});
                       					},
                       					error: function(){
                       						alert('Error while request..');
                       					}
                                    });
                				},
                            	symbol:'url(<c:url value="/resources/images/left.png" />)',
                        	}
                        }
                    }
                });
                
                $('.info_link').click(function(event){
                	var hv1=$(this).attr('href');
            	    var result = hv1.split("#")[1];
            	    var result1=result.split("=")[1];
            	    var result2=result1.split("&")[0];
            	    var hv = $('#power').val();
            	    var hv1 = $('#hiddenValue1').val();
             	  	
            	    if(parseInt(result2) > parseInt(hv1)){
            	    	window.location.href = result+hv.trim();
            	    }
            	    else{
            	    	window.location.href="Previous?id="+result2+"&lastPage="+hv1+"&valuePage="+hv.trim();
            	    }
             	  	
            	  });
                
                $('.info_link2').click(function(event){
               	 if($('#power').val()=='')
        	    	{
        	    	alert('select VT');
        	    	}
        	    	else{
               	var hv1=$(this).attr('href');
               	var result = hv1.split("#")[1];
               	var hv = $('#power').val();
               	window.location.href=result+hv.trim();
        	    	}  
        	    });
                
                
                $("#last").click(function(event){
                	if($('#power').val()=='')
        	    	{
        	    	alert('select VT');
        	    	}
                	else
                		{
             	  	var hv = $('#power').val();
                	window.location.href ="result?id=${idValue}&value="+hv.trim();
             	  		}
            	  });
          	             	   
          	});
                
                    
                    
                    function createGraph(chartOptions) {
                        $(document).ready(function () {
                            chartOptions.chart.events.click = function () {
                                hs.htmlExpand(document.getElementById(chartOptions.chart.renderTo), {
                                    width: 999,
                                    height: 599,
                                    allowWidthReduction: true,
                                    preserveContent: false
                                }, {
                                    chartOptions: chartOptions
                                });
                            };
                            var chart = new Highcharts.Chart(chartOptions);
                        });
                    }

                    hs.Expander.prototype.onAfterExpand = function () {
                        if (this.custom.chartOptions) {
                            var chartOptions = this.custom.chartOptions;
                            if (!this.hasChart) {
                                chartOptions.chart.renderTo = $('.highslide-body')[0];
                                chartOptions.chart.events.click = function () {
                                };
                                
                                var hsChart = new Highcharts.Chart(chartOptions);
                            }
                            this.hasChart = true;
                        }
                    };
         
    </script> 
 
   
  </head>
  <body>
<header>
	<h1 style="font-family:Helvetica Neue">Expert Opinion For VT2 Determination</h1>
	<div id="backlinks">
		<a href="#" id="last" ><font size="5" style="font-family:Helvetica Neue">End-Survey</font></a>
	</div>
	
</header>

<section id="wrapperss" style="width:100%;margin:80px auto 50px;position:relative;">
  <div id="container">
  <input type="hidden" name="hiddenValue" id="hiddenValue" value=""/>
  <input type="hidden" name="hiddenValue1" id="hiddenValue1" value="${idValue}"/>
  <center>
  <!-- <progress value="${idValue *5}" max="100" id="progBar" >
	</progress> -->
	<div style="float: left;"><b style="font-family:Helvetica Neue">DataSet-${dataSetnumber}</b></div><b style="font-size: 24px" style="font-family:Helvetica Neue">Wasserman-9Plot Graphs</b><div style="float: right;"> <b style="font-family:Helvetica Neue"> ${dataSetnumber *5}% of 100%</b> <progress value="${dataSetnumber *5}" max="100" id="progBar" >
	</progress></div><br/>
	        <div id="element_to_pop_up" style="display:none;" >Select VT value</div>
    <table>
        <tr>
        <c:if test="${idValue != 1}">
        	<td><a href="#Previous?id=${dataSetnumber -1}&lastPage=${dataSetnumber}&valuePage=" class="info_link2" style="font-family:Helvetica Neue">Previous</a></td>
        	<td><c:out value="<<"/></td>
        </c:if>
            <c:forEach begin="1" end="20" var="i">
                <c:choose>
                    <c:when test="${idValue eq i}">
                        <!--  <td><a class="info_link" href="#">${idValue}</a></td>-->
                        
                        <td><a  class="info_link" href="#" >${idValue}</a></td>
                    </c:when>
                    <c:otherwise>
                    <td>${i}</td> 
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            <c:if test="${idValue lt 20 }">
            <td><c:out value=">>"/></td>
        	<td><a href="#WassermanGraphs?id=${idValue +1}&value=" class="info_link" style="font-family:Helvetica Neue">Next</a></td>
        </c:if>
        </tr>
    </table>
     <br/>
    VO2: <input id="vo2" name="vo2"  type="text"  />
    VCO2: <input id="vco2" name="vco2"  type="text" />
    VE: <input id="ve" name="ve"  type="text" />
    Power: <input id="power" name="power"  type="text" />
    </center>
    <div>
        <div id="container0" class="box white"></div>
         <div id="container4" class="box white"></div>
         <div id="container7" class="box white"></div>
    </div>
    
    <div class="right col2">
        <div id="container2" class="box white"></div>
         <div id="container5" class="box white"></div>
         <div id="container8" class="box white"></div>
    </div>
    
    <div class="right col2">
        <div id="container3" class="box white"></div>
          <div id="container6" class="box white"></div>
          <div id="container9" class="box white"></div>
    </div>
    <div class="header">
    <center>
    <table>
        <tr>
        <c:if test="${idValue != 1}">
        	<td><a href="#Previous?id=${dataSetnumber -1}&lastPage=${dataSetnumber}&valuePage=" class="info_link2" style="font-family:Helvetica Neue">Previous</a></td>
        	<td><c:out value="<<"/></td>
        </c:if>
            <c:forEach begin="1" end="20" var="i">
                <c:choose>
                    <c:when test="${idValue eq i}">
                        <td><a  class="info_link" href="#" >${idValue}</a></td>
                    </c:when>
                    <c:otherwise>
                      <td>${i}</td> 
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            <c:if test="${idValue lt 20 }">
            <td><c:out value=">>"/></td>
        	<td><a href="#WassermanGraphs?id=${idValue +1}&value=" class="info_link" style="font-family:Helvetica Neue">Next</a></td>
        </c:if>
        </tr>
    </table>
    </center> 
    </div>
</div>
</section>
<footer>
	<span style="font-family:Helvetica Neue">&copy; 2014 <a href="http://www.uni-konstanz.de/" style="font-family:Helvetica Neue">Universität Konstanz</a>.</span>
</footer>
  </body>
</html>