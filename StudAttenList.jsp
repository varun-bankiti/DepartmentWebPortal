<%@page errorPage="errors.jsp" %>
<%
String user = (String)session.getAttribute("user");
if(user==null)
	out.print(user.length());
else if(!(session.getAttribute("access_lvl").toString()).equals("3"))
	out.print(9/0);
%>
<style type="text/css">
#stuDetails
{
font-family:"Trebuchet MS", Arial, Helvetica, sans-serif;
width:700px;
border-collapse:collapse;
align:center;
text-align:center;
frame:box;
}

#stuDetails th 
{
font-size:1.1em;
text-align:center;
padding-top:5px;
padding-bottom:4px;
background-color:#BCD670;
color:#ffffff;
}
#stuDetails td
{
font-size:1.0em;
text-align:center;
padding-top:5px;
padding-bottom:4px;
}
</style>

<%@page import="java.sql.*, java.util.Date,java.text.SimpleDateFormat"%>
<%
	String clss = request.getParameter("clss");
	String date = request.getParameter("date");
	Connection con = null;
	Class.forName("com.mysql.jdbc.Driver");
    con= DriverManager.getConnection("jdbc:mysql://localhost/cse?user=root&password=cse");
    PreparedStatement ps = null;
    String qry = "SELECT count(*) FROM attendance WHERE class=? and date=?";
	ps = con.prepareStatement(qry);
	ps.setString(1,clss);
	ps.setString(2,date);
	ResultSet rs = ps.executeQuery();
	rs.next();
	if(rs.getInt(1)>=1)
	{
		out.println("<center><font color='red' size=15>Attendance already exists</font></center>");
		}
	else
	{
	qry = "SELECT name,stu_id FROM student WHERE class=?";
	ps = con.prepareStatement(qry);
	ps.setString(1,clss);
	rs = ps.executeQuery();
	out.print("<form id='attendance'><center><table id='stuDetails' ><tr><th>Student Name</th><th>Student Id</th><th>Attendance Report</th></tr>");
	int a=0;
	while(rs.next()) 
	{
		if((a%2)==0)
		{
		out.print("<tr bgcolor='#F4EAFF'><td>"+rs.getString(1)+"</td><td>"+rs.getString(2)+"</td><td><input type='checkbox' name="+rs.getString(2)+"checked=' checked ' /></td></tr>");
		a++;
		}
	else  
		{
		out.println("<tr bgcolor='#EBD8FA'><td>"+rs.getString(1)+"</td><td>"+rs.getString(2)+"</td><td><input type='checkbox' name="+rs.getString(2)+"checked=' checked ' /></td></tr>");
		a++;
			}
		}
	out.println("</table><br /><input type='button' value='Submit Attendance'  onclick='post_attendance()'/></form>");
	}
	%>
