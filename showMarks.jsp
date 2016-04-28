<%@page import="java.sql.*"%>
<%@page errorPage="errors.jsp" %>
<%
String user = (String)session.getAttribute("user");
if(user==null)
	out.print(user.length());
else if(!(session.getAttribute("access_lvl").toString()).equals("3"))
	out.print(9/0);
%>
<%
String id = request.getParameter("id");
String exam = request.getParameter("exam");
String subject = request.getParameter("subject");
Connection con = null;
Class.forName("com.mysql.jdbc.Driver");
con= DriverManager.getConnection("jdbc:mysql://localhost/cse?user=root&password=cse");
PreparedStatement ps = null;
String qry = "SELECT marks FROM internal_marks WHERE subject=? and stu_id=? and exam=?";
ps = con.prepareStatement(qry);
ps.setString(1,subject);
ps.setString(2,id);
ps.setString(3,exam);
ResultSet rs = ps.executeQuery();
rs.next();
try
{
	String temp = rs.getString(1);
	out.println("<center>Marks Report</center><table align='center' width=300px cellpadding=0px cellspacing=0px > <tr bgcolor='#FAF5F5' height=35px align='center'><td > Id </td><td> "+id+"</td></tr>");
	out.println("<tr  bgcolor='#F1E2E2' height=35px align='center'><td> Marks </td><td> "+temp+"</td></tr>");
	}
catch(Exception e)
{
	out.println("<center><font color='red'>Marks doesn't exists</font></center>");
	}
%>
