<%@ page import="classes.Employee,org.hibernate.HibernateException,org.hibernate.Session,org.hibernate.Transaction,
org.hibernate.SessionFactory,java.util.List,org.hibernate.Query,java.util.Iterator,java.util.*,java.io.*,
org.hibernate.cfg.Configuration,org.hibernate.cfg.AnnotationConfiguration,
java.sql.Date,java.sql.*,classes.Holiday,org.hibernate.SQLQuery,org.hibernate.Criteria"%>
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
<td>Holiday Id</td>
<td>Starting Date</td>
<td>Ending Date</td>
<td>No of Days</td>
<td>Delete</td>
</tr>
<% 
String employeeId=request.getParameter("item");



SessionFactory factory;
Configuration configuration;
configuration=new Configuration();
configuration=configuration.configure();
 factory= configuration.buildSessionFactory();
 Session sessionNew= factory.openSession(); 
	Transaction transaction = null;
	try
	{
		transaction = sessionNew.beginTransaction(); 
		String sql = "SELECT Holiday_Id,Starting_Date,Ending_Date,datediff(Ending_Date,Starting_Date) as days FROM HOLIDAY WHERE Employee_Id = :employee_id"; 
		SQLQuery query = sessionNew.createSQLQuery(sql);
		query.setParameter("employee_id",employeeId);
		query.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);
		List results = query.list();
		for (Object ob : results)
		{
			Map raw=(Map)ob;
			
	%>
  <tr style="font-family:verdana;font-size:12px;"> 
  <td> <font color="green"><%=raw.get("Holiday_Id")%></font> </td>
    <td> <font color="green"><%=raw.get("Starting_Date")%></font> </td>
	<td> <font color="green"><%=raw.get("Ending_Date")%></font> </td>
	<td> <font color="green"><%=raw.get("days")%></font> </td>
	<td> <a href="http://localhost:8080/Employee_Management_System/Records/Employees/holidayDelete/<%=raw.get("Holiday_Id")%>">Delete</a></td>
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
