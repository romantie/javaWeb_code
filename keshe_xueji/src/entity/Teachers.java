package entity;

public class Teachers {
   private String id;
   public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}

private String t_no;
   private String t_name;
   private String t_sex;

public void setString(String id) {
	this.id = id;
}
public String getT_no() {
	return t_no;
}
public void setT_no(String t_no) {
	this.t_no = t_no;
}
public String getT_name() {
	return t_name;
}
public void setT_name(String t_name) {
	this.t_name = t_name;
}
public String getT_sex() {
	return t_sex;
}
public void setT_sex(String t_sex) {
	this.t_sex = t_sex;
}

public Teachers() {
	super();
	// TODO Auto-generated constructor stub
}
   
}
