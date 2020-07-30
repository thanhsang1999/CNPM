package model;

public class MonAn {
	private String STT;
	private String TENMONAN;
	private String HINH;
	private String GIA;
	private String MOTA;
	public MonAn(String STT, String TENMONAN, String HINH, String GIA, String MOTA) {
		this.STT = STT;
		this.TENMONAN = TENMONAN;
		this.HINH = HINH;
		this.GIA = GIA;
		this.MOTA = MOTA;
	}
	public MonAn() {
	}
	public String getSTT() {
		return STT;
	}
	public void setSTT(String sTT) {
		STT = sTT;
	}
	public String getTENMONAN() {
		return TENMONAN;
	}
	public void setTENMONAN(String tENMONAN) {
		TENMONAN = tENMONAN;
	}
	public String getHINH() {
		return HINH;
	}
	public void setHINH(String hINH) {
		HINH = hINH;
	}
	public String getGIA() {
		return GIA;
	}
	public void setGIA(String gIA) {
		GIA = gIA;
	}
	public String getMOTA() {
		return MOTA;
	}
	public void setMOTA(String mOTA) {
		MOTA = mOTA;
	}
	@Override
	public String toString() {
		return "MonAn [STT=" + STT + ", TENMONAN=" + TENMONAN + ", HINH=" + HINH + ", GIA=" + GIA + ", MOTA=" + MOTA
				+ "]";
	}
	
	
}
