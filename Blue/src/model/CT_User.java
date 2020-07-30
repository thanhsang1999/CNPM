package model;

public class CT_User {
	String ID_CT_ACCOUNT;
	String ID_ACCOUNT;
	String HO_TEN;
	String EMAIL;
	String SDT;
	String DIA_CHI;
	int GIOI_TINH;
	String NGAY_SINH;
	public CT_User(String iD_CT_ACCOUNT, String iD_ACCOUNT, String hO_TEN, String eMAIL, String sDT, String dIA_CHI,
			int gIOI_TINH, String nGAY_SINH) {
		super();
		ID_CT_ACCOUNT = iD_CT_ACCOUNT;
		ID_ACCOUNT = iD_ACCOUNT;
		HO_TEN = hO_TEN;
		EMAIL = eMAIL;
		SDT = sDT;
		DIA_CHI = dIA_CHI;
		GIOI_TINH = gIOI_TINH;
		NGAY_SINH = nGAY_SINH;
	}
	public String getID_CT_ACCOUNT() {
		return ID_CT_ACCOUNT;
	}
	public void setID_CT_ACCOUNT(String iD_CT_ACCOUNT) {
		ID_CT_ACCOUNT = iD_CT_ACCOUNT;
	}
	public String getID_ACCOUNT() {
		return ID_ACCOUNT;
	}
	public void setID_ACCOUNT(String iD_ACCOUNT) {
		ID_ACCOUNT = iD_ACCOUNT;
	}
	public String getHO_TEN() {
		return HO_TEN;
	}
	public void setHO_TEN(String hO_TEN) {
		HO_TEN = hO_TEN;
	}
	public String getEMAIL() {
		return EMAIL;
	}
	public void setEMAIL(String eMAIL) {
		EMAIL = eMAIL;
	}
	public String getSDT() {
		return SDT;
	}
	public void setSDT(String sDT) {
		SDT = sDT;
	}
	public String getDIA_CHI() {
		return DIA_CHI;
	}
	public void setDIA_CHI(String dIA_CHI) {
		DIA_CHI = dIA_CHI;
	}
	public int getGIOI_TINH() {
		return GIOI_TINH;
	}
	public void setGIOI_TINH(int gIOI_TINH) {
		GIOI_TINH = gIOI_TINH;
	}
	public String getNGAY_SINH() {
		return NGAY_SINH;
	}
	public void setNGAY_SINH(String nGAY_SINH) {
		NGAY_SINH = nGAY_SINH;
	}
	public CT_User() {
		super();
	}
	
}
