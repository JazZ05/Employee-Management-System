<%@ page import="classes.Employee,org.hibernate.HibernateException,org.hibernate.Session,org.hibernate.Transaction,
org.hibernate.SessionFactory,java.util.List,org.hibernate.Query,java.util.Iterator,java.util.*,java.io.*,
org.hibernate.cfg.Configuration,org.hibernate.cfg.AnnotationConfiguration"%>
<html>
<head>
<title>Abyeti Technologies</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<link href="css/stylegreen.css" rel="stylesheet" type="text/css" />
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5/jquery.min.js"></script>  
 <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script> 

 <script type="text/javascript">
       $(function() {
               $("#startDate").datepicker({ dateFormat: "yy/mm/dd" }).val()
                $("#endDate").datepicker({ dateFormat: "yy/mm/dd" }).val()
       });
   </script>

</head>

<body>
<form name="f" method="POST" action="http://localhost:8080/Employee_Management_System/Records/Employees/grant" onSubmit="return true;">
<div id="outerwrapper">

<div id="head">
    
   <div id="logo">
      <div style="font-size:35px;color:white;font-family-verdana;padding:30px 40px 30px 20px;line-height:1.2em;font-weight:bold;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Abyeti Technologies </div>
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
<td class="paragraping1" colspan="2" valign="top" align="center"><font color="#FF0000" size="4">Holiday Grant</font></td>
</tr>
<tr>
<td height="42" colspan="2"><br></td>
</tr>
<tr>
<td width="176" height="48">Employee Id:</td>
<td width="412"><input id="inputArea" type="text"  value="<%=request.getParameter("item")%>" name="Employee_id"/></td>
</tr>
<tr>
<td width="176" height="48">Starting Date:</td>
<td width="412"><input id="startDate" type="text" name="start"/></td>
</tr>
<tr>
<td height="40">Ending Date:</td>
<td><input id="endDate" type="text" name="end"/></td>
</tr>
<tr>
<tr>
<td height="40"></td>
<td><input type="submit" name="sub" value="Grant" class="submit"/>

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