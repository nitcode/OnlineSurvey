package com.survey.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class User_Results {

	@Id
	@GeneratedValue
	private int id;
	
	@Column(name="data_set")
	private String DataSet;
	
	@Column(name="session_id")
	private String Session;
	
	@Column(name="vo2")
	private String VO2;
	
	@Column(name="vco2")
	private String VCO2;
	
	@Column(name="ve")
	private int VE;
	
	@Column(name="power")
	private int Power;
	
	@Column(name="title")
	private String Title;
	
	@Column(name="expertname")
	private String ExpertName;
	
	@Column(name="experience")
	private String Experience;
	
	@Column(name="testsnumber")
	private String TestsNumber;
	
	@Column(name="email")
	private String Email;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDataSet() {
		return DataSet;
	}

	public void setDataSet(String DataSet) {
		this.DataSet = DataSet;
	}

	public String getSession() {
		return Session;
	}

	public void setSession(String Session) {
		this.Session = Session;
	}

	public String getVO2() {
		return VO2;
	}

	public void setVO2(String vO2) {
		VO2 = vO2;
	}

	public String getVCO2() {
		return VCO2;
	}

	public void setVCO2(String vCO2) {
		VCO2 = vCO2;
	}

	public int getVE() {
		return VE;
	}

	public void setVE(int vE) {
		VE = vE;
	}

	public int getPower() {
		return Power;
	}

	public void setPower(int power) {
		Power = power;
	}

	public String getTitle() {
		return Title;
	}

	public void setTitle(String title) {
		Title = title;
	}

	public String getExpertName() {
		return ExpertName;
	}

	public void setExpertName(String expertName) {
		ExpertName = expertName;
	}

	public String getExperience() {
		return Experience;
	}

	public void setExperience(String experience) {
		Experience = experience;
	}

	public String getTestsNumber() {
		return TestsNumber;
	}

	public void setTestsNumber(String testsNumber) {
		TestsNumber = testsNumber;
	}

	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
	}
		
}
