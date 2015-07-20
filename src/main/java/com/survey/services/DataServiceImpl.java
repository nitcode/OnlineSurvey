package com.survey.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.survey.dao.DataDao;
import com.survey.domain.GraphPlot;
import com.survey.domain.User_Results;

public class DataServiceImpl implements DataService {
	
	@Autowired
	DataDao dataDao;

	@Override
	public List<GraphPlot> getUpdatedGraphPlotList(String tableName) {
		return dataDao.getUpdatedGraphPlotList(tableName);
	}

	@Override
	public List<GraphPlot> getRowByTime(int id, String table) {
		return dataDao.getRowByTime(id,table);
	}

	@Override
	public List<GraphPlot> getRowByVCO2(double VCO2, double VE, String table) {
		return dataDao.getRowByVCO2(VCO2,VE,table);
	}

	@Override
	public List<GraphPlot> getRowByVO2(double VO2, double VCO2, String table) {
		return dataDao.getRowByVO2(VO2,VCO2,table);
	}

	@Override
	public int insertData(User_Results user) {
		return dataDao.insertData(user);
	}

	@Override
	public List<GraphPlot> getRowByVE(double VE, double VT, String table) {
		return dataDao.getRowByVE(VE,VT,table);
	}

	@Override
	public List<GraphPlot> getRowByPower(int power, String table) {
		return dataDao.getRowByPower(power,table);
	}
}