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
var b = document.f.Mname.value;
var c =document.f.Lname.value;
var d = document.f.Phone.value;
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
alert("Enter Your Middle Name");
document.f.Mname.focus();
return false;
}
if(!isNaN(b))
{
alert("Enter Character Only");
document.f.Mname.focus();
return false;
}
if(c=="")
{
alert("Enter Your Last Name");
document.f.Lname.focus();
return false;
}
if(!isNaN(c))
{
alert("Enter Character Only");
document.f.Lname.focus();
return false;
}
if(d=="")
    {
        alert("Please enter the Mobile number");
			document.f.Phone.focus();
        return false;
    }
	if(isNaN(d))
    {
        alert("Please enter the Correct Mobile number");
			document.f.Phone.focus();
        return false;
    }
	 if (d.length!=10)
           {
                alert("Mobile should have 10 numbers");
				document.f.Phone.focus();
                return false;
           }
	return true;
}
</script>
</head>

<body>
<form name="f" method="post" action="http://localhost:8080/Employee_Management_System/Records/Employees/create" onSubmit="return valid();">
<div id="outerwrapper">

<div id="head">
    
   <div id="logo">
      <div style="font-size:35px;color:white;font-family-verdana;padding:30px 40px 30px 20px;line-height:1.2em;font-weight:bold;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Abyeti Technologies </div>
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
<table align="center" width="1015">
<tr>
<td width="364" height="693" valign="top">
<table align="center" width="336">
<tr>
<td height="44"><img src="img/arrow.jpg"></td>
<td width="328">&nbsp;&nbsp;<a href="employeeAllDetails.jsp">Employees</a></td>
</tr>

<tr>
<td height="44"><img src="img/arrow.jpg"></td>
<td width="328">&nbsp;&nbsp;<a href="newEmployee.jsp">New Employee</a></td>
</tr>
</table>
</td>
<td width="639" valign="top">
<table align="center" width="600">
<tr>
<td class="paragraping1" colspan="2" valign="top" align="center"><font color="#FF0000" size="4">New Employee Register Here</font></td>
</tr>
<tr>
<td height="42" colspan="2"><br></td>
</tr>
<tr>
<td width="176" height="48">First Name:</td>
<td width="412"><input id="inputArea" type="text" name="Fname"/></td>
</tr>
<tr>
<td width="176" height="48">Middle Name:</td>
<td width="412"><input id="inputArea" type="text" name="Mname"/></td>
</tr>
<tr>
<td height="40">Last Name:</td>
<td><input id="inputArea" type="text" name="Lname"/></td>
</tr>
<tr>
<td height="40">Phone Number:</td>
<td><input id="inputArea" type="number" name="Phone"/></td>
</tr>
<tr>
<td height="40"></td>
<td><input type="submit" name="sub" value="Submit" class="submit"/>

<input type="reset" name="clear" value="Clear" class="clear"></td>
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