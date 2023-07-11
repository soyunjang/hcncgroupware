package com.hs.home.controller;

public class UserInfo {
	private String USER_ID;			// 사용자ID
	private String USER_PW;			// 사용자PW
	private String USER_NM;			// 사용자명
	private String PDEPT_CD;		// 상위 부서코드
	private String PDEPT_NM;		// 상위 부서명
	private String DEPT_CD;			// 부서코드
	private String DEPT_NM;			// 부서명
	private String GRADE_CD;			// 직급코드
	private String GRADE_NM;		// 직급명
	private String ENTER_DT;		// 입사일자
	private String BIRTHDAY;		// 생일
	private String EMAIL;			// 이메일 
	private String PHONE_NUM;		// 전화번호
	private String AUTH_TYPE_CD;	// 권한코드
	private String USER_IP;			// 사용자IP
	private String USER_LNAG;		// 다국어 KOR:한국어, ENG:영어, CHN:중국어
	private String CONNECT_DT;		// 접속시간

	public String getUSER_ID() {
		return USER_ID;
	}

	public void setUSER_ID(String uSER_ID) {
		USER_ID = uSER_ID;
	}

	public String getUSER_PW() {
		return USER_PW;
	}

	public void setUSER_PW(String uSER_PW) {
		USER_PW = uSER_PW;
	}

	public String getUSER_NM() {
		return USER_NM;
	}

	public void setUSER_NM(String uSER_NM) {
		USER_NM = uSER_NM;
	}
	
	public String getPDEPT_CD() {
		return PDEPT_CD;
	}

	public void setPDEPT_CD(String pDEPT_CD) {
		PDEPT_CD = pDEPT_CD;
	}

	public String getPDEPT_NM() {
		return PDEPT_NM;
	}

	public void setPDEPT_NM(String pDEPT_NM) {
		PDEPT_NM = pDEPT_NM;
	}

	public String getDEPT_CD() {
		return DEPT_CD;
	}

	public void setDEPT_CD(String dEPT_CD) {
		DEPT_CD = dEPT_CD;
	}

	public String getDEPT_NM() {
		return DEPT_NM;
	}

	public void setDEPT_NM(String dEPT_NM) {
		DEPT_NM = dEPT_NM;
	}

	public String getGRADE_CD() {
		return GRADE_CD;
	}

	public void setGRADE_CD(String gRADE_CD) {
		GRADE_CD = gRADE_CD;
	}

	public String getGRADE_NM() {
		return GRADE_NM;
	}

	public void setGRADE_NM(String gRADE_NM) {
		GRADE_NM = gRADE_NM;
	}

	public String getENTER_DT() {
		return ENTER_DT;
	}

	public void setENTER_DT(String eNTER_DT) {
		ENTER_DT = eNTER_DT;
	}

	public String getBIRTHDAY() {
		return BIRTHDAY;
	}

	public void setBIRTHDAY(String bIRTHDAY) {
		BIRTHDAY = bIRTHDAY;
	}

	public String getEMAIL() {
		return EMAIL;
	}

	public String getPHONE_NUM() {
		return PHONE_NUM;
	}

	public void setPHONE_NUM(String pHONE_NUM) {
		PHONE_NUM = pHONE_NUM;
	}

	public void setEMAIL(String eMAIL) {
		EMAIL = eMAIL;
	}

	public String getAUTH_TYPE_CD() {
		return AUTH_TYPE_CD;
	}

	public void setAUTH_TYPE_CD(String aUTH_TYPE_CD) {
		AUTH_TYPE_CD = aUTH_TYPE_CD;
	}

	public String getUSER_IP() {
		return USER_IP;
	}

	public void setUSER_IP(String uSER_IP) {
		USER_IP = uSER_IP;
	}

	public String getUSER_LNAG() {
		return USER_LNAG;
	}

	public void setUSER_LNAG(String uSER_LNAG) {
		USER_LNAG = uSER_LNAG;
	}

	public String getCONNECT_DT() {
		return CONNECT_DT;
	}

	public void setCONNECT_DT(String cONNECT_DT) {
		CONNECT_DT = cONNECT_DT;
	}

	@Override
	public String toString() {
		return "UserInfo [USER_ID=" + USER_ID + ", USER_PW=" + USER_PW + ", USER_NM=" + USER_NM
				+ ", PDEPT_CD=" + PDEPT_CD + ", PDEPT_NM=" + PDEPT_NM
				+ ", DEPT_CD=" + DEPT_CD + ", DEPT_NM=" + DEPT_NM + ", GRADE_CD=" + GRADE_CD + ", GRADE_NM=" + GRADE_NM
				+ ", ENTER_DT=" + ENTER_DT + ", BIRTHDAY=" + BIRTHDAY + ", EMAIL=" + EMAIL + ", PHONE_NUM=" + PHONE_NUM
				+ ", AUTH_TYPE_CD=" + AUTH_TYPE_CD + ", USER_IP=" + USER_IP + ", USER_LNAG=" + USER_LNAG + ", CONNECT_DT=" + CONNECT_DT
				
				+ ", getUSER_ID()=" + getUSER_ID() + ", getUSER_PW()=" + getUSER_PW() + ", getUSER_NM()=" + getUSER_NM() 
				+ ", getPDEPT_CD()=" + getPDEPT_CD() + ", getPDEPT_NM()=" + getPDEPT_NM() 
				+ ", getDEPT_CD()=" + getDEPT_CD() + ", getDEPT_NM()=" + getDEPT_NM() + ", getGRADE_CD()=" + getGRADE_CD() + ", getGRADE_NM()=" + getGRADE_NM()
				+ ", getENTER_DT()=" + getENTER_DT() + ", getBIRTHDAY()=" + getBIRTHDAY() + ", getEMAIL()=" + getEMAIL()
				+ ", getPHONE_NUM()=" + getPHONE_NUM() + ", getAUTH_TYPE_CD()=" + getAUTH_TYPE_CD() 
				+ ", getUSER_IP=" + getUSER_IP() + ", getUSER_LNAG=" + getUSER_LNAG() 
				+ ", getCONNECT_DT=" + getCONNECT_DT() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode() 
				+ ", toString()=" + super.toString() + "]";
	}
}