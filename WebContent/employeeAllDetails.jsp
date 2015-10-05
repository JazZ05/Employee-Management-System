<%@ page import="classes.Employee,org.hibernate.HibernateException,org.hibernate.Session,org.hibernate.Transaction,
org.hibernate.SessionFactory,java.util.List,org.hibernate.Query,java.util.Iterator,java.util.*,java.io.*,
org.hibernate.cfg.Configuration,org.hibernate.cfg.AnnotationConfiguration"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<title>Abyeti Technologies</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<link href="css/stylegreen.css" rel="stylesheet" type="text/css" />
<style type="text/css">

	#inputArea
	{
	    font-family: verdana;
	    font-size: 13px;
	    margin-bottom: 5px;
	    display: block;
	    padding: 4px;
	    width: 300px;
	}
  .submit {

	background:#FFFFFF url("img/submit.jpg") no-repeat left ;
	font-size:11px;
	font-weight:bold;
	width:94px;
	height:30px;
}
    </style>
</head>

<body>
<form name="f">
<div id="outerwrapper">

<div id="head">
   <div id="logo">
      <div style="font-size:35px;color:white;font-family-verdana;padding:30px 40px 30px 20px;line-height:1.2em;font-weight:bold;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Abyeti Technologies</div>
   </div><!-- end of logo -->
   <div id="navigation">
      <div id="navbar_link">
         <ul>
          <li class="currentpage"><a href="index.html">Home</a></li>
           <li><a href="employeeAllDetails.jsp">Employees</a></li>
          	<li><a href="newEmployee.jsp">New Employee</a></li>
        </ul>
      </div>
      </div>
  </div>
<div id="innerwrapper">
<table align="center" width="1020">
<tr bgcolor="#FFFFCC" style="font-family:verdana;font-size:12px;">
<td height="36">Employee Id</td>
<td>First Name</td>
<td>Middle Name</td>
<td>Last Name</td>
<td>Phone Number</td>
<td>Delete</td>
<td>Update</td>
<td>Holiday Check</td>
<td>Holiday Grant</td>
</tr>
<% 
String firstName=null,middleName=null, lastName=null;
String phoneNumber=null;
String employeeId=null;
SessionFactory factory;
Configuration configuration ;
configuration=new Configuration();
configuration=configuration.configure();
 factory= configuration.buildSessionFactory();
 Session sessionNew= factory.openSession(); 
	Transaction transaction = null;
	try
	{
		transaction = sessionNew.beginTransaction(); 
		List <Employee> employees = sessionNew.createQuery("FROM Employee").list();
		for (Iterator it= employees.iterator(); it.hasNext();)
		{
			Employee employee=new Employee();
		employee=(Employee)it.next(); 
		employeeId=String.valueOf(employee.getEmployeeId());
		firstName=employee.getFirstName();
		middleName=employee.getMiddleName();
		lastName=employee.getLastName();
		phoneNumber=employee.getPhoneNumber();    
	%>
  <tr style="font-family:verdana;font-size:12px;"> 
    <td> <font color="green"><%=employeeId%></font> </td>
	<td> <font color="green"><%=firstName%></font> </td>
    <td> <font color="green"><%=middleName%></font> </td>
    <td> <font color="green"><%=lastName%></font> </td>
    <td> <font color="green"><%=phoneNumber%></font> </td>
    <td> <a href="http://localhost:8080/Employee_Management_System/Records/Employees/employeeDelete/<%=employeeId%>">Delete</a></td>
     <td> <a href="updateEmployee.jsp?item=<%=employeeId%>">Update</a></td> 
     <td> <a href="holiday.jsp?item=<%=employeeId%>">Check</a></td>
     <td> <a href="newHoliday.jsp?item=<%=employeeId %>">Grant</a> </td>
    </tr>
	        <%
		}
		transaction.commit(); 
		


%>
      
<%
	}
catch (HibernateException e)
{ 
	if (transaction!=null) transaction.rollback(); 
	 }
finally 
{ 
	sessionNew.close(); 
	}
	    
%>
</table> <br><br> <br><br>   <br><br>   <br><br>   <br><br>   <br><br>   <br><br>    
</div>
<div id="footer">

</div>
</div>
</form>
</body>
</html>
