package model;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class Date {
	int YYYY;
	int MM;
	int DD;
	int hh;
	int mm;
	double ss;
	
	


	public Date(int YYYY, int MM, int DD, int hh, int mm, double ss) {
		this.YYYY = YYYY;
		this.MM = MM;
		this.DD = DD;
		this.hh = hh;
		this.mm = mm;
		this.ss = ss;
//		if (!check()) {
//			System.out.println("Not corect day");
//		}
	}
	
	public Date(String str) {
		
		String[] arrStr =str.split(" ");
		String[] arrStr1 =arrStr[0].split("-");
		String[] arrStr2 =arrStr[1].split(":");
		this.YYYY = Integer.parseInt(arrStr1[0]);
		this.MM = Integer.parseInt(arrStr1[1]);
		this.DD = Integer.parseInt(arrStr1[2]);
		this.hh = Integer.parseInt(arrStr2[0]);
		this.mm = Integer.parseInt(arrStr2[1]);
		this.ss = Double.parseDouble(arrStr2[2]);
		if (!check()) {
			System.out.println("Not corect day");
		}
	}
//	YYYY-MM-DD hh:mm:ss
	public String getStringByFormat(String str) {
		String rs=str;
		String tmp="";
		if(rs.contains("YYYY")) rs=rs.replaceAll("YYYY", this.YYYY+"");
		if(rs.contains("MM")) {
			tmp=this.MM+"";
			if(tmp.length()==1)tmp="0"+tmp;
			rs=rs.replaceAll("MM", tmp); 
		}	else if(rs.contains("M")) rs=rs.replaceAll("M", this.MM+""); 
		if(rs.contains("DD")) {
			tmp=this.DD+"";
			if(tmp.length()==1)tmp="0"+tmp;
			rs=rs.replaceAll("DD", tmp); 
		}	else if(rs.contains("D")) rs=rs.replaceAll("D", this.DD+""); 
		if(rs.contains("hh")) {
			tmp=this.hh+"";
			if(tmp.length()==1)tmp="0"+tmp;
			rs=rs.replaceAll("hh", tmp); 
		}	else if(rs.contains("h")) rs=rs.replaceAll("h", this.hh+""); 
		if(rs.contains("mm")) {
			tmp=this.mm+"";
			if(tmp.length()==1)tmp="0"+tmp;
			rs=rs.replaceAll("mm", tmp); 
		}	else if(rs.contains("m")) rs=rs.replaceAll("m", this.mm+""); 
		if(rs.contains("ss")) {
			tmp=this.ss+"";
			if(tmp.length()==1)tmp="0"+tmp;
			rs=rs.replaceAll("ss", tmp); 
		}	else if(rs.contains("s")) rs=rs.replaceAll("s", this.ss+""); 
				
			
		return rs;
	}


	public int getYYYY() {
		return YYYY;
	}




	public void setYYYY(int yYYY) {
		YYYY = yYYY;
	}




	public int getMM() {
		return MM;
	}




	public void setMM(int mM) {
		MM = mM;
	}




	public int getDD() {
		return DD;
	}




	public void setDD(int dD) {
		DD = dD;
	}




	public int getHh() {
		return hh;
	}




	public void setHh(int hh) {
		this.hh = hh;
	}




	public int getMm() {
		return mm;
	}




	public void setMm(int mm) {
		this.mm = mm;
	}




	public double getSs() {
		return ss;
	}




	public void setSs(double ss) {
		this.ss = ss;
	}
	public boolean checkYYYY() {
		return (this.YYYY%4==0&&this.YYYY%100!=0)||this.YYYY%400==0;
	}
	public boolean check() {
		if(this.DD<=0||this.MM<=0||this.MM>12) {
			return false;
		}
		switch (this.MM) {
		case 1:
		case 3:
		case 5:
		case 7:
		case 8:
		case 10:
		case 12:
			if(this.DD>31) {
				return false;
			}
			break;
		case 2:
			if(checkYYYY()) {
				if (this.DD>29) {
					return false;
				}
			}else {
				if (this.DD>28) {
					return false;
				}
			}
			break;

		default:
			if (this.DD>30) {
				return false;
			}
			break;
		}
		return true;
	}
	public int compare(Date b) {
		if(this.getYYYY()==b.getYYYY()) {
			if(this.getMM()==b.getMM()) {
				if(this.getDD()<b.getDD()) {
					return compare2(b);
				} 
				if(this.getDD()>b.getDD()) {
					return -b.compare2(this);
				} 
				return 0;
			}
			if(this.getMM()<b.getMM()) {
				return compare2(b);
			} else return -b.compare2(this);
		}
		if(this.getYYYY()<b.getYYYY()) {
			return compare2(b);
		} else return -b.compare2(this);
	
	
	}
	public int compare2(Date b) {
		Date tmp=null;
		int rs=0;
		tmp=this.clone();
		if (tmp.equals(b)) {
			return rs;
		}
		rs++;
		while(!(tmp=tmp.incre()).equals(b)) {
			rs++;
		}
		
		return rs;
	}
	public Date incre() {
		Date rs=new Date(this.YYYY, this.MM,++this.DD, this.hh, this.mm, this.ss);
		if(!rs.check()) {
			rs.setDD(1);
			rs.setMM(rs.getMM()+1);
			if(!rs.check()) {
				rs.setMM(1);
				rs.setYYYY(rs.getYYYY()+1);
			}
		}
		return rs;
	}

	//	2019-11-20 00:00:00.0
	public static void main(String[] args) {
		String str="2017-2-28 00:00:00.0";
		String str2="2017-2-27 00:00:00.0";
		Date d = new Date(str);
		Date d2 = new Date(str2);
		String[] arrStr =str.split(" ");
		String[] arrStr1 =arrStr[0].split("-");
		String[] arrStr2 =arrStr[1].split(":");
		
		d = new Date(Integer.parseInt(arrStr1[0]), 
				Integer.parseInt(arrStr1[1]),
				Integer.parseInt(arrStr1[2]),
				Integer.parseInt(arrStr2[0]), 
				Integer.parseInt(arrStr2[1]), 
				Double.parseDouble(arrStr2[2]));
		System.out.println(getCurrentDay().getStringByFormat("DD-MM-YYYY hh:mm:ss"));
		
	}
	public Date clone() {
		return new Date(this.YYYY, this.MM,this.DD, this.hh, this.mm, this.ss);
	}
	public boolean equals(Date d) {
		return this.MM==d.getMM()&&this.YYYY==d.getYYYY()&&this.DD==d.getDD();
	}
	public static Date getCurrentDay() {
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");  
		LocalDateTime now = LocalDateTime.now();  
		return new Date(dtf.format(now));
	}

}
