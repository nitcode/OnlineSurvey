package com.survey.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;

@Entity
@Inheritance(strategy=InheritanceType.TABLE_PER_CLASS)
public class GraphPlot {

	@Id
	@GeneratedValue(strategy = GenerationType.TABLE)
	private int id;
	
	@Column(name="vo2")
	private String VO2;
	
	@Column(name="vco2")
	private String VCO2;
	
	@Column(name="last")
	private int Last;
		
	@Column(name="ve")
	private int VE;
	
	@Column(name="ve_vo2")
	private double VE_VO2;
	
	@Column(name="ve_vco2")
	private double VE_VCO2;
	
	@Column(name="hr")
	private int HR;
	
	@Column(name="vo2_kg")
	private double VO2_KG;
	
	@Column(name="rer")
	private double RER;
	
	@Column(name="peto2")
	private int PET_O2;
	
	@Column(name="petco2")
	private int PET_CO2;
	
	@Column(name="vt")
	private double VT;
	
	public double getRER() {
		return RER;
	}

	public void setRER(double rER) {
		RER = rER;
	}

	public double getVO2_KG() {
		return VO2_KG;
	}

	public void setVO2_KG(double vO2_KG) {
		VO2_KG = vO2_KG;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public int getLast() {
		return Last;
	}

	public void setLast(int last) {
		Last = last;
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

	public double getVE_VO2() {
		return VE_VO2;
	}

	public void setVE_VO2(double vE_VO2) {
		VE_VO2 = vE_VO2;
	}

	public double getVE_VCO2() {
		return VE_VCO2;
	}

	public void setVE_VCO2(double vE_VCO2) {
		VE_VCO2 = vE_VCO2;
	}

	public int getHR() {
		return HR;
	}

	public void setHR(int hR) {
		HR = hR;
	}

	public int getPET_O2() {
		return PET_O2;
	}

	public void setPET_O2(int pET_O2) {
		PET_O2 = pET_O2;
	}

	public int getPET_CO2() {
		return PET_CO2;
	}

	public void setPET_CO2(int pET_CO2) {
		PET_CO2 = pET_CO2;
	}

	public double getVT() {
		return VT;
	}

	public void setVT(double vT) {
		VT = vT;
	}
}