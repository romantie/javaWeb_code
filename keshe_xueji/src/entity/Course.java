package entity;

public class Course {
	private String id;
	private String course_no;
	private String course_name;
	private String course_time;
	private String course_site;
	private String course_credit;
	private String course_teacher;
	private String course_type;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCourse_no() {
		return course_no;
	}
	public void setCourse_no(String course_no) {
		this.course_no = course_no;
	}
	public String getCourse_name() {
		return course_name;
	}
	public void setCourse_name(String course_name) {
		this.course_name = course_name;
	}
	public String getCourse_time() {
		return course_time;
	}
	public void setCourse_time(String course_time) {
		this.course_time = course_time;
	}
	public String getCourse_site() {
		return course_site;
	}
	public void setCourse_site(String course_site) {
		this.course_site = course_site;
	}
	public String getCourse_credit() {
		return course_credit;
	}
	public void setCourse_credit(String course_credit) {
		this.course_credit = course_credit;
	}
	public String getCourse_teacher() {
		return course_teacher;
	}
	public void setCourse_teacher(String course_teacher) {
		this.course_teacher = course_teacher;
	}
	public String getCourse_type() {
		return course_type;
	}
	public void setCourse_type(String course_type) {
		this.course_type = course_type;
	}
	public Course(String id, String course_no, String course_name, String course_time, String course_site,
			String course_credit, String course_teacher, String course_type) {
		super();
		this.id = id;
		this.course_no = course_no;
		this.course_name = course_name;
		this.course_time = course_time;
		this.course_site = course_site;
		this.course_credit = course_credit;
		this.course_teacher = course_teacher;
		this.course_type = course_type;
	}
	public Course() {
		super();
	}
	
}
