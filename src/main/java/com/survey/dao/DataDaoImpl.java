package com.survey.dao;

import java.io.Serializable;
import java.util.List;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;

import com.survey.domain.GraphPlot;
import com.survey.domain.User_Results;

public class DataDaoImpl implements DataDao {

	@Autowired
	SessionFactory sessionFactory;

	@Override
	public List<GraphPlot> getUpdatedGraphPlotList(String tableName) {
		Session session = sessionFactory.openSession();
		@SuppressWarnings("unchecked")
		List<GraphPlot> graphUpdatedList = session.createQuery("from "+tableName)
				.list();
		session.close();
		return graphUpdatedList;
	}

	@Override
	public List<GraphPlot> getRowByTime(int id,String table) {
		Session session = sessionFactory.openSession();
		
		@SuppressWarnings("unchecked")
		List<GraphPlot> graphSelectedList=null;
		graphSelectedList= session.createQuery("from "+table+" where last="+id).list();
		if(graphSelectedList.size()==0)
		{
			id=id-1;
			graphSelectedList= session.createQuery("from "+table+" where last="+id).list();
		}
		session.close();
		
		return graphSelectedList;
	}

	@Override
	public List<GraphPlot> getRowByVCO2(double VCO2, double VE, String table) {
		Session session = sessionFactory.openSession();
		
		@SuppressWarnings("unchecked")
		List<GraphPlot> graphVCO2List = session.createQuery("from "+table+" where vco2="+VCO2 +"and ve="+VE)
				.list();
		session.close();
		
		return graphVCO2List;
	}

	@Override
	public List<GraphPlot> getRowByVO2(double VO2, double VCO2, String table) {
		Session session = sessionFactory.openSession();
		
		@SuppressWarnings("unchecked")
		List<GraphPlot> graphVO2List = session.createQuery("from "+table+" where vo2="+VO2 +"and vco2="+VCO2)
				.list();
		session.close();
		
		return graphVO2List;
	}

	@Override
	public int insertData(User_Results user) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		session.save(user);
		tx.commit();
		Serializable id = session.getIdentifier(user);
		session.close();
		return (Integer) id;
	}

	@Override
	public List<GraphPlot> getRowByVE(double VE, double VT, String table) {
		Session session = sessionFactory.openSession();
		
		@SuppressWarnings("unchecked")
		List<GraphPlot> graphVEList = session.createQuery("from "+table+" where ve="+VE +"and vt="+VT)
				.list();
		session.close();
		
		return graphVEList;
	}
	
	@Override
	public List<GraphPlot> getRowByPower(int power, String table) {
		Session session = sessionFactory.openSession();
		@SuppressWarnings("unchecked")
		List<GraphPlot> dataGraph = session.createQuery("from "+table+" where last="+power)
				.list();
		session.close();
		
		return dataGraph;
	}
}