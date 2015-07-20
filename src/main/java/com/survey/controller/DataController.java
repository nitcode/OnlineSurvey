package com.survey.controller;

import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.survey.domain.*;
import com.survey.services.DataService;

@Controller
public class DataController {
	
	private static final Logger logger = Logger.getLogger(DataController.class);
	
	@Autowired
	DataService dataService;
	String uName;
	String utitle;
	String numberTests;
	String exp;
	String mail;
	LinkedHashMap<Object,List<GraphPlot>> resultData=new LinkedHashMap<Object,List<GraphPlot>>();
	Map<Integer,String> thresholdValuesData=new HashMap<Integer, String>();

	
	@RequestMapping("expertRegister")
	public ModelAndView registerExpert(HttpServletRequest request,HttpSession session) {
		
		logger.info("Expert data fetched");
		
		uName=request.getParameter("username");
		utitle=request.getParameter("title");
		numberTests=request.getParameter("experience");
		exp=request.getParameter("experience1");
		mail=request.getParameter("mail");
		
		session.setAttribute("uname",uName);
		session.setAttribute("tname",utitle);
		session.setAttribute("ename1",numberTests);
		session.setAttribute("ename",exp);
		session.setAttribute("mname",mail);
		
		session.setAttribute("dataSetnumber" , null);
		session.setAttribute("sessionId" , "");
		
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.setViewName("redirect");
		
		return modelAndView;
	}	
	
	
	@RequestMapping("graphplotTime")
	public ModelAndView getGraphPlot(@RequestParam int id,@RequestParam int tableId) {
		
		logger.info("Data fetched by time");
		
		Map<Integer, String> tableNames=DataSetList.dataSetName();
		String tableName= tableNames.get(tableId);
		List<GraphPlot> graphTime = dataService.getRowByTime(id,tableName);
		
		return new ModelAndView("graphplotTime","graphTime",graphTime);
	}
	
	@RequestMapping("graphplotVCO2")
	public ModelAndView getVCO2(@RequestParam double VCO2,@RequestParam double VE,@RequestParam int tableId) {
		
		logger.info("Data fetched by VCO2");
		
		Map<Integer, String> tableNames=DataSetList.dataSetName();
		String tableName= tableNames.get(tableId);
		List<GraphPlot> graphVCO2 = dataService.getRowByVCO2(VCO2,VE,tableName);
		
		return new ModelAndView("graphplotVCO2","graphVCO2",graphVCO2);
	}
	
	@RequestMapping("graphplotVO2")
	public ModelAndView getVO2(@RequestParam double VO2,@RequestParam double VCO2,@RequestParam int tableId) {
		
		logger.info("Data fetched by VO2");
		
		Map<Integer, String> tableNames=DataSetList.dataSetName();
		String tableName= tableNames.get(tableId);
		List<GraphPlot> graphVO2 = dataService.getRowByVO2(VO2,VCO2,tableName);
		
		return new ModelAndView("graphplotVO2","graphVO2",graphVO2);
	}
	
	
	@RequestMapping("graphplotVE")
	public ModelAndView getVE(@RequestParam double VE,@RequestParam double VT,@RequestParam int tableId) {
		
		logger.info("Data fetched by VE");
		
		Map<Integer, String> tableNames=DataSetList.dataSetName();
		String tableName= tableNames.get(tableId);
		List<GraphPlot> graphVE = dataService.getRowByVE(VE,VT,tableName);
		
		return new ModelAndView("graphplotVE","graphVE",graphVE);
	}
	
	
	@RequestMapping("WassermanGraphs")
	public ModelAndView getUpdatedGraphPlot(@RequestParam int id,@RequestParam String value,HttpSession session,HttpServletRequest request) {
		
		logger.info("Wasserman graphs displayed for dataset-"+id);
		
		Map<Integer, String> tableNames=DataSetList.dataSetName();
		
		String tableName=  tableNames.get(id);
		
		List<GraphPlot> graphValues = dataService.getUpdatedGraphPlotList(tableName);
		
		ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("WassermanGraphs");
        modelAndView.addObject("graphValues",graphValues);
        
        session.setAttribute("dataSetnumber" , id);
       
        if(id>1) {
        	if(thresholdValuesData.containsKey(id)) {
        		List<GraphPlot> thresholdValues = dataService.getRowByPower(Integer.parseInt(thresholdValuesData.get(id)), tableName);  
        		modelAndView.addObject("thresholdValues",thresholdValues);
        	}
        	else {
        		thresholdValuesData.put(id-1, value);
        	}
        	
        }
        
        return modelAndView;
	}
	

	@RequestMapping("result")
	public ModelAndView getresult(@RequestParam int id,@RequestParam String value, HttpSession session,HttpServletRequest request) {
		
		logger.info("Summary of all the results");
		
		thresholdValuesData.put(id, value);
		
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.setViewName("result");
		
		
		Map<Integer, String> tableNames=DataSetList.dataSetName();
			
		Iterator it = thresholdValuesData.entrySet().iterator();
		while (it.hasNext()) {
			Map.Entry<Integer, String> pair = (Map.Entry)it.next();
			resultData.put(pair.getKey(),dataService.getRowByPower(Integer.parseInt(pair.getValue()), tableNames.get(pair.getKey())));
		}
		
		modelAndView.addObject("dataList",resultData);
    	
		request.setAttribute("expertt", uName);
		request.setAttribute("tit", utitle);
		request.setAttribute("test", numberTests);
		request.setAttribute("experience", exp);
		request.setAttribute("maill", mail);
		
		return modelAndView;
	}
	
	@RequestMapping("Previous")
	public ModelAndView getoldGraphPlot(@RequestParam int id,@RequestParam int lastPage,@RequestParam String valuePage, HttpSession session) {
		
		logger.info("Wasserman graphs displayed for dataset-"+id);
		
		Map<Integer, String> tableNames=DataSetList.dataSetName();
		
		String tableName= tableNames.get(id);
		List<GraphPlot> oldGraphValues = dataService.getUpdatedGraphPlotList(tableName);
		
		session.setAttribute("idValue", id);
		session.setAttribute("dataSetnumber" , id);
		
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.setViewName("Previous");
		modelAndView.addObject("oldGraphValues",oldGraphValues);
		
		List<GraphPlot> thresholdValues = dataService.getRowByPower(Integer.parseInt(thresholdValuesData.get(id)), tableName);
    	modelAndView.addObject("thresholdValues",thresholdValues);
		
		return modelAndView;
	}
	
	@RequestMapping("last")
	public ModelAndView getlast(HttpSession session, @ModelAttribute User_Results user,Model model) {
	
		logger.info("Results stored");	
		
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.setViewName("last");
	
		User_Results users = new User_Results();
		Iterator iterator = resultData.keySet().iterator();
		while (iterator.hasNext()) {
			Integer key = (Integer) iterator.next();
			List list =  (List) resultData.get(key);
		   users.setTitle(utitle);
		   users.setExpertName(uName);
		   users.setExperience(exp);
		   users.setTestsNumber(numberTests);
		   users.setEmail(mail);
		   users.setDataSet("Data-Set"+key);
		   users.setSession(session.getId());
		   users.setPower(((GraphPlot) list.get(0)).getLast());
		   users.setVCO2(((GraphPlot) list.get(0)).getVCO2());
		   users.setVO2(((GraphPlot) list.get(0)).getVO2());
		   users.setVE(((GraphPlot) list.get(0)).getVE());		   
		   dataService.insertData(users);   
		}
		session.invalidate();
		model.asMap().clear();
		return modelAndView;
	}	
}