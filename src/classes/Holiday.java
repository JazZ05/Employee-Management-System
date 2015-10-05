package classes;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.sql.Date;
@Entity @Table(name = "Holiday")
public class Holiday {
	@Id @GeneratedValue 
	 @Column(name = "Holiday_id")  
	private int holidayId;
	 @Column(name = "Starting_Date")
	private Date startingDate;
	  @Column(name = "Ending_Date")
	private Date endingDate;
	   @Column(name = "Employee_Id")
	private int employeeId;
	   public Holiday()
	   {
	   	
	   }
	public int getHolidayId() {
		return holidayId;
	}
	public void setHolidayId(int holidayId) {
		this.holidayId = holidayId;
	}
	public Date getStartingDate() {
		return startingDate;
	}
	public void setStartingDate(Date startingDate) {
		this.startingDate = startingDate;
	}
	public Date getEndingDate() {
		return endingDate;
	}
	public void setEndingDate(Date endingDate) {
		this.endingDate = endingDate;
	}
	public int getEmployeeId() {
		return employeeId;
	}
	public void setEmployeeId(int employeeId) {
		this.employeeId = employeeId;
	}
	
}
