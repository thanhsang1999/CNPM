package model;

public class DateChuyenDoiDATABASE {
	int ngay;
	int thang;
	int nam;
	
	public DateChuyenDoiDATABASE() {
		super();
	}
	public DateChuyenDoiDATABASE(String input) {
		super();
		String tmp[] = input.split("-");
		this.ngay = Integer.parseInt(tmp[2]);
		this.thang =Integer.parseInt(tmp[1]);
		this.nam = Integer.parseInt(tmp[0]);
	}
	public DateChuyenDoiDATABASE(int ngay, int thang, int nam) {
		super();
		this.ngay = ngay;
		this.thang = thang;
		this.nam = nam;
	}
	public int getNgay() {
		return ngay;
	}
	public void setNgay(int ngay) {
		this.ngay = ngay;
	}
	public int getThang() {
		return thang;
	}
	public void setThang(int thang) {
		this.thang = thang;
	}
	public int getNam() {
		return nam;
	}
	public void setNam(int nam) {
		this.nam = nam;
	}
	@Override
	public String toString() {
		if (thang<10) {
			return ngay+"/0"+thang+"/"+nam;
		}else {
			return ngay+"/"+thang+"/"+nam;
		}
	}
	
}
