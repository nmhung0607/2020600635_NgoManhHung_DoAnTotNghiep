package com.DoAn.NgoManhHung.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * khi gọi là property: có nghĩa là phải có 2 hàm là get và set
 * @author daing
 *
 */
@Entity // Báo jpa biết đây là Entity
@Table(name = "tbl_contact") // Entity sẽ mapping với Table nào
public class Contact extends BaseEntity {

	@Column(name = "first_name", length = 45, nullable = false)
	private String firstName; 

	@Column(name = "last_name", length = 45, nullable = false)
	private String lastName;

	@Column(name = "email", length = 1000, nullable = true)
	private String email;
	
	@Column(name = "message", length = 1000, nullable = true)
	private String message;

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
	
}
