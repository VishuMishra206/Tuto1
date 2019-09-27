package Entities;

import java.sql.Blob;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "courses")
public class Courses {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "C_Id")
	private Integer cid;

	@Column(name = "CourseName")
	private String cname;

	@Column(name="CourseFile")
	private Blob pdfFile;

	public Integer getCid() {
		return cid;
	}

	public void setCid(Integer cid) {
		this.cid = cid;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public Blob getPdfFile() {
		return pdfFile;
	}

	public void setPdfFile(Blob pdfFile) {
		this.pdfFile = pdfFile;
	}
	
	
}