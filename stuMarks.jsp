<%@page import="java.sql.*" %>
<%
String course = (String)session.getAttribute("course");
String id = (String)session.getAttribute("user");
Connection con = null;
Class.forName("com.mysql.jdbc.Driver");
con= DriverManager.getConnection("jdbc:mysql://localhost/cse?user=root&password=cse");
PreparedStatement ps = null;
String qry = "select course from courses where course_id=?";
ps=con.prepareStatement(qry);
ps.setString(1,course);
ResultSet rs = ps.executeQuery();
rs.next();
course=rs.getString(1);
qry = "select * from internal_marks where stu_id=? and subject=?";
ps=con.prepareStatement(qry);
ps.setString(1,id);
ps.setString(2,course);
rs = ps.executeQuery();
int count=0;
out.print("<table align='center' width=200 >");
try{
while(rs.next())
	{
		if(count==0)
				out.print("<tr><td> Exam </td><td>Marks</td></tr>");
		out.println("<tr><td>"+rs.getString(5)+"</td><td>"+rs.getString(6)+"</td></tr>");
		count++;
		}
}
catch(Exception e)
{
	out.println("<br><h2 align=center>No marks available</h2>");
	}
out.println("</table>");
if(count==0)
	out.println("<br><h2 align=center>No marks available</h2>");
%>
