<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript" language="javascript">
function chk_onclick()
{
	var myform=document.pform;
	if(myform.username.value=="" || myform.passwd.value=="")
	{
		alert("PLEASE COMPLETE ALL THE SPECIFICATION");
		if(myform.username.value=="")
		{
			myform.username.focus();
		}
		else
		{
			myform.passwd.focus();
		}
	}
	
}
	  </script>
</head>
<font face="verdana,arial" size=-1>
<center><table cellpadding=2 cellspacing=0 border=0 height=500 width=600>

<tr><td bgcolor="blue"><B>JOB SEEKER'S LOGIN</B>
<table cellpadding=0 cellspacing=0 border=0 width=100%><tr>
<img src="login-icon.gif"   width="100" height="100">
<td bgcolor="blue" align=center style="padding:2;padding-bottom:4">

<b><font size=-1 color="white" 
face="verdana,arial"><b>Enter your login and password</b></font></td></tr>
<tr><td bgcolor="white" style="padding:5"><br>

<form method="post" action="LOGIN_A.jsp" name=pform>

<center><table>
<tr><td><font face="verdana,arial" size=-1>USERNAME:</td><td>
<input type="text" name="username"></td></tr>
<tr><td><font face="verdana,arial" size=-1>PASSWORD:</td><td>
<input type="password" name="passwd"></td></tr>
<tr><td><font face="verdana,arial" size=-1>&nbsp;
</td><td><font face="verdana,arial" size=-1>
<input type="submit" value="SUBMIT" name=chkform onclick="chk_onclick()"></td></tr>
<tr><td colspan=2><font face="verdana,arial" size=-1>&nbsp;</td></tr>

<tr><td colspan=2><font face="verdana,arial" size=-1>Not member yet? Click <a 

href="1.jsp">here</a> to register.</td></tr>
<td align="right" valign="bottom"><img src="1.gif"   width="5" height="5" ></td>
</table></center>
</form>
<form method="post" action="home1.jsp">
<input maxlength="255" size="30" value="HOME" type="submit" >
</form>
</td></tr></table></td></tr></table>
</body>
</html>
 <%
 
 String k1=request.getParameter("username");
 session.setAttribute("t1",k1);
 if(k1!=null){
try{
	//int flag=2;
	//String k1=request.getParameter("username");
	String k2=request.getParameter("passwd");
	Class.forName("com.mysql.jdbc.Driver");
	Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/abc","user11","user10702");
	Statement s =c.createStatement();
	String sql = "select * from applicant where username='"+k1+"'";// and password='"+k2+"'";
	ResultSet rs=s.executeQuery(sql);
	rs.next();
	String pass=rs.getString(5);
	
	if(k2.equals(pass))
	{
		 %>
		  <jsp:forward page="app_home.jsp" />
	<%}
	else
	{
	 %><script type="text/javascript" language="javascript">
		  alert("Your ID and Password do not match.Enter a valid Login Id and Password.");
		  </script>
	 <%}
	
	}catch(Exception e) 
	{
	%><script type="text/javascript" language="javascript">
			alert("INVALID USER ID");
			</script>
	<%}
}
%>
