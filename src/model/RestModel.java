package model;
import javax.ws.rs.DELETE;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;  
import javax.ws.rs.PathParam;  
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.UriInfo;
import classes.Holiday;
import classes.Employee;
import java.util.ArrayList;
import java.util.List;
import com.sun.research.ws.wadl.Response;
import model.AccessModel;
@Path("/Employees")  
public class RestModel {  
	AccessModel accessModel=new AccessModel();
	@POST
	@Path("/grant")
	@Produces(MediaType.TEXT_HTML) 
	public String grantHoliday(@FormParam("Employee_id") String employeeId,@FormParam("start")String start,
 			@FormParam("end") String end)
	{
		
		String title="<title>Abyeti Technologies</title>";
 		String body="<body>";
 		String body1="<a href=\"http://localhost:8080/Employee_Management_System/employeeAllDetails.jsp\"> Go Back to Employees Page </a></body>";

  		String functionResult=accessModel.grantHoliday(employeeId, start, end);
				
		return "<html> " + title + body + functionResult + body1 +"</html> "; 
	    	}
     @POST  
     @Path("/create")  
      @Produces(MediaType.TEXT_HTML)  
      public String createEmployee(@FormParam("Fname") String firstName,
    			@FormParam("Mname") String middleName,
    			@FormParam("Lname") String lastName,
    			@FormParam("Phone") String phoneNumber) {
     	String title="<title>Abyeti Technologies</title>";
 		String body="<body>";
 		String body1="<a href=\"http://localhost:8080/Employee_Management_System/employeeAllDetails.jsp\"> Go Back to Employees Page </a></body>";
     String functionResult=accessModel.createEmployee(firstName, middleName, lastName,phoneNumber);
    return "<html> " + title + body + functionResult + body1 +"</html> "; 
    
      }  
     @POST
     @Path("/update")
     @Produces(MediaType.TEXT_HTML)
     public String update(@FormParam("Employee_Id") String employeeId,
    		 @FormParam("Fname") String firstName,
    		@FormParam("Mname") String middleName,
    		@FormParam("Lname") String lastName,
 			@FormParam("Phone") String phone) 
     {
    	 
    	String title="<title>Abyeti Technologies</title>";
  		String body="<body>";
  		String body1="<a href=\"http://localhost:8080/Employee_Management_System/employeeAllDetails.jsp\"> Go Back to Employees Page </a></body>";
        String functionResult=accessModel.updateEmployee(employeeId, firstName, middleName, lastName, phone);
  		return "<html> " + title + body + functionResult+ body1 +"</html> "; 
    	    
     }
     @GET
     @Path("/holidayDelete/{holi_id}")
     @Produces(MediaType.TEXT_HTML)
     public String deleteHoliday(@PathParam("holi_id") int holidayId)
     {
    	String functionResult=accessModel.deleteHoliday(holidayId, 0);
    	String title="<title>Abyeti Technologies</title>";
   		String body="<body>";
   		String body1="<a href=\"http://localhost:8080/Employee_Management_System/employeeAllDetails.jsp\"> Go Back to Employees Page </a></body>";
    	return "<html> " + title + body + functionResult + body1 +"</html> ";
     }
     @GET
     @Path("/employeeDelete/{employeeId}")
     @Produces(MediaType.TEXT_HTML)
     public String deleteEmployee(@PathParam("employeeId") int employeeId)
     {
    	
    	 String functionResult=accessModel.deleteEmployee(employeeId);
    	String title="<title>Abyeti Technologies</title>";
   		String body="<body>";
   		String body1="<a href=\"http://localhost:8080/Employee_Management_System/employeeAllDetails.jsp\"> Go Back to Employees Page </a></body>";
   		return "<html> " + title + body +functionResult + body1 +"</html> ";
     }
        
      
 
     
}  
