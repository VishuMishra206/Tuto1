package Entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "user")
public class Users {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "U_Id")
	private Integer uid;
	
	@Column(name = "NAME")
	private String name;

	@Column(name="Email")
	private String email;
	
	@Column(name="Password")
	private String password;
	
	/*@Column(name="CourseDuration")
	private Integer courseduration;
	
	@Column(name="PaymentStatus")
	private Boolean paymentstatus;*/
	
	/*@Column(name="UserType")
	private String usertype;*/
	
//	@OneToMany()
//	private Courses courseDetail;
//	
	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
/*
	public Integer getCourseduration() {
		return courseduration;
	}

	public void setCourseduration(Integer courseduration) {
		this.courseduration = courseduration;
	}

	public Boolean getPaymentstatus() {
		return paymentstatus;
	}

	public void setPaymentstatus(Boolean paymentstatus) {
		this.paymentstatus = paymentstatus;
	}



	public Courses getCourseDetail() {
		return courseDetail;
	}

	public void setCourseDetail(Courses courseDetail) {
		this.courseDetail = courseDetail;
	}*/
	/*public Integer getCid() {
		return cid;
	}

	public void setCid(Integer cid) {
		this.cid = cid;
	}*/
	
	/*public String getUsertype() {
		return usertype;
	}

	public void setUsertype(String usertype) {
		this.usertype = usertype;
	}*/
}
	