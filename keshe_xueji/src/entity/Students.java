package entity;

public class Students {
	   private String st_no;
	   private String st_name;
	   private String st_birthday;
	   private String st_Email;
	   private String st_phone;
	   private String st_classno;
	   private String st_roll;
	public String getSt_no() {
		return st_no;
	}
	public void setSt_no(String st_no) {
		this.st_no = st_no;
	}
	public String getSt_name() {
		return st_name;
	}
	public void setSt_name(String st_name) {
		this.st_name = st_name;
	}
	public String getSt_birthday() {
		return st_birthday;
	}
	public void setSt_birthday(String st_birthday) {
		this.st_birthday = st_birthday;
	}
	public String getSt_Email() {
		return st_Email;
	}
	public void setSt_Email(String st_Email) {
		this.st_Email = st_Email;
	}
	public String getSt_phone() {
		return st_phone;
	}
	public void setSt_phone(String st_phone) {
		this.st_phone = st_phone;
	}
	public String getSt_classno() {
		return st_classno;
	}
	public void setSt_classno(String st_classno) {
		this.st_classno = st_classno;
	}
	public String getSt_roll() {
		return st_roll;
	}
	public void setSt_roll(String st_roll) {
		this.st_roll = st_roll;
	}
	public Students(String st_no, String st_name, String st_birthday, String st_Email, String st_phone,
			String st_classno, String st_roll) {
		super();
		this.st_no = st_no;
		this.st_name = st_name;
		this.st_birthday = st_birthday;
		this.st_Email = st_Email;
		this.st_phone = st_phone;
		this.st_classno = st_classno;
		this.st_roll = st_roll;
	}
	public Students() {
		super();
	}
	
	   
}
