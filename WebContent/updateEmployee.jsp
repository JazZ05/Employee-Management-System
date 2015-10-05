<%@ page import="classes.Employee,org.hibernate.HibernateException,org.hibernate.Session,org.hibernate.Transaction,
org.hibernate.SessionFactory,java.util.List,org.hibernate.Query,java.util.Iterator,java.util.*,java.io.*,
org.hibernate.cfg.Configuration,org.hibernate.cfg.AnnotationConfiguration,
java.sql.*,classes.Holiday,org.hibernate.SQLQuery,org.hibernate.Criteria"%>
<html>
<head>
<title>Abyeti Technologies</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<link href="css/stylegreen.css" rel="stylesheet" type="text/css" />
<script language="JavaScript">
function valid()
{
var a = document.f.Fname.value;
var b = document.f.Lname.value;
var c = document.f.Phone.value;
if(a=="")
{
alert("Enter Your First Name");
document.f.Fname.focus();
return false;
}
if(!isNaN(a))
{
alert("Enter Character Only");
document.f.Fname.focus();
return false;
}
if(b=="")
{
alert("Enter Your Last Name");
document.f.Lname.focus();
return false;
}
if(c=="")
    {
        alert("Please enter the Mobile number");
			document.f.Phone.focus();
        return false;
    }
	if(isNaN(c))
    {
        alert("Please enter the Correct Mobile number");
			document.f.Phone.focus();
        return false;
    }
	 if (c.length!=10)
           {
                alert("Mobile should have 10 numbers");
				document.f.Phone.focus();
                return false;
           }
	return true;
}
</script>
</head>
<%
String employeeId=request.getParameter("item");
String firstName=null;
String middleName=null;
String lastName=null;
String phone=null;
SessionFactory factory;
Configuration configuration;
configuration=new Configuration();
configuration=configuration.configure();
 factory= configuration.buildSessionFactory();
 Session sessionNew= factory.openSession(); 
	Transaction transaction = null;
	try
	{
		String sql = "SELECT First_Name,Middle_Name,Last_Name,Phone_Number FROM EMPLOYEE WHERE Employee_Id = :employee_id"; 
		SQLQuery query = sessionNew.createSQLQuery(sql);
		query.setParameter("employee_id",employeeId);
		query.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);
		List results = query.list();
		for (Object ob : results)
		{
			Map raw=(Map)ob;
			firstName=raw.get("First_Name").toString();
			middleName=raw.get("Middle_Name").toString();
			lastName=raw.get("Last_Name").toString();
			phone=raw.get("Phone_Number").toString();
			
			%>
			 <%
		}
	
		


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
<body>
<form name="f" method="POST" action="http://localhost:8080/Employee_Management_System/Records/Employees/update" onSubmit="return valid();">
<div id="outerwrapper">

<div id="head">
    
   <div id="logo">
      <div style="font-size:35px;color:white;font-family-verdana;padding:30px 40px 30px 20px;line-height:1.2em;font-weight:bold;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Abyeti Technologies</div>
   </div><!-- end of logo -->
   <div id="navigation">
      <div id="navbar_link">
        
      </div>
      </div>
  </div>
<div id="innerwrapper">
<table align="center" width="1015">
<tr>
<td width="364" height="693" valign="top">

</td>
<td width="639" valign="top">
<table align="center" width="600">
<tr>
<td class="paragraping1" colspan="2" valign="top" align="center"><font color="#FF0000" size="4">Employee Updation</font></td>
</tr>
<tr>
<td height="42" colspan="2"><br></td>
</tr>
<tr>
<td width="176" height="48">Employee Id:</td>
<td width="412"><input id="inputArea" type="text"  value="<%=request.getParameter("item")%>" name="Employee_Id"/></td>
</tr>
<tr>
<td width="176" height="48">First Name:</td>
<td width="412"><input id="inputArea" type="text" name="Fname" value="<%=firstName%>"/></td>
</tr>
<tr>
<td width="176" height="48">Middle Name:</td>
<td width="412"><input id="inputArea" type="text" name="Mname" value="<%=middleName%>"/></td>
</tr>
<tr>
<td height="40">Last Name:</td>
<td><input id="inputArea" type="text" name="Lname" value="<%=lastName%>"/></td>
</tr>
<tr>
<td height="40">Phone Number:</td>
<td><input id="inputArea" type="text" name="Phone" value="<%=phone%>"/></td>
</tr>
<tr>
<td height="40"></td>
<td><input type="submit" name="sub" value="Update" class="submit"/>


</tr>
<tr>

</tr>
</table>
</td>
</tr>
</table>   
</div>
<div id="footer">

</div>
</div>
</form>
</body>
</html>