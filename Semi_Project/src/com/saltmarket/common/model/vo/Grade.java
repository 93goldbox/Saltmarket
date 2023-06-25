package com.saltmarket.common.model.vo;

public class Grade {
	
	private int gradeNo;         //	GRADE_NO	NUMBER
	private String gradeName;    //	GRADE_NAME	VARCHAR2(100 BYTE)
	private int minGrade;        //	MIN_GRADE	NUMBER
	private int maxGrage;        //	MAX_GRADE	NUMBER
	
	public Grade() { }

	public Grade(int gradeNo, String gradeName, int minGrade, int maxGrage) {
		super();
		this.gradeNo = gradeNo;
		this.gradeName = gradeName;
		this.minGrade = minGrade;
		this.maxGrage = maxGrage;
	}
	
	public Grade(int gradeNo, String gradeName) {
		super();
		this.gradeNo = gradeNo;
		this.gradeName = gradeName;
	}

	public int getGradeNo() {
		return gradeNo;
	}

	public void setGradeNo(int gradeNo) {
		this.gradeNo = gradeNo;
	}

	public String getGradeName() {
		return gradeName;
	}

	public void setGradeName(String gradeName) {
		this.gradeName = gradeName;
	}

	public int getMinGrade() {
		return minGrade;
	}

	public void setMinGrade(int minGrade) {
		this.minGrade = minGrade;
	}

	public int getMaxGrage() {
		return maxGrage;
	}

	public void setMaxGrage(int maxGrage) {
		this.maxGrage = maxGrage;
	}

	@Override
	public String toString() {
		return "Grade [gradeNo=" + gradeNo + ", gradeName=" + gradeName + ", minGrade=" + minGrade + ", maxGrage="
				+ maxGrage + "]";
	}
	
}
