package com.survey.dao;

import java.util.List;

import com.survey.domain.GraphPlot;
import com.survey.domain.User_Results;

public interface DataDao {
	
	public int insertData(User_Results user);
	
	public List<GraphPlot> getUpdatedGraphPlotList(String tableName);
	
	public List<GraphPlot> getRowByTime(int id,String table);
	
	public List<GraphPlot> getRowByPower(int power,String table);
	
	public List<GraphPlot> getRowByVCO2(double VCO2,double VE, String table);
	
	public List<GraphPlot> getRowByVO2(double VO2,double VCO2, String table);
	
	public List<GraphPlot> getRowByVE(double VE,double VT, String table);	
}