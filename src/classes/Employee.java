package classes;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity @Table(name = "Employee")
public class Employee {
 @Id @GeneratedValue 
 @Column(name = "Employee_Id")  
private int employeeId;
 @Column(name = "First_Name")
private String firstName;
 @Column(name = "Middle_Name")
 private String middleName;
  @Column(name = "Last_Name")
private String lastName;
   @Column(name = "Phone_Number")
private String phoneNumber;
public Employee()
{
	
}
public int getEmployeeId() {
	return employeeId;
}
public void setEmployeeId(int employeeId) {
	this.employeeId = employeeId;
}
public String getFirstName() {
	return firstName;
}
public void setFirstName(String firstName) {
	this.firstName = firstName;
}
public String getMiddleName() {
	return middleName;
}
public void setMiddleName(String middleName) {
	this.middleName = middleName;
}
public String getLastName() {
	return lastName;
}
public void setLastName(String lastName) {
	this.lastName = lastName;
}
public String getPhoneNumber() {
	return phoneNumber;
}
public void setPhoneNumber(String phoneNumber) {
	this.phoneNumber = phoneNumber;
}

}
