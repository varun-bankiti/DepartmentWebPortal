<%@page import="java.sql.*, java.util.Date,java.text.SimpleDateFormat"%>
<%@page errorPage="errors.jsp" %>
<%
String user = (String)session.getAttribute("user");
if(user==null)
	out.print(user.length());
else if(!(session.getAttribute("access_lvl").toString()).equals("3"))
	out.print(9/0);
%>
<html>
<body>
<br />
<%
	String clss = request.getParameter("clss");
	String date = request.getParameter("date");
	Connection con = null;
    Class.forName("com.mysql.jdbc.Driver");
    con= DriverManager.getConnection("jdbc:mysql://localhost/cse?user=root&password=cse");
    PreparedStatement ps = null;
	String qry = "SELECT name,stu_id FROM student WHERE class=?";
	ps = con.prepareStatement(qry);
	ps.setString(1,clss);
	ResultSet rs = ps.executeQuery();
	String [] report = request.getParameter("report").split(" ");
	String absent="";
	int temp=0;
	int count=0;
	while(rs.next())
	{
		if(report[count].equals("false"))
			if(temp==0)
				{
				absent=rs.getString(2); temp=1;
					}
			else
				absent = absent+","+rs.getString(2);
		count++;
		}
	qry = "UPDATE attendance set absent=? where fac_id=? and class=? and date=?";
	ps = con.prepareStatement(qry);
	ps.setString(1,absent);
	ps.setString(2,(String)session.getAttribute("user"));
	ps.setString(3,clss);
	ps.setString(4,date);
	ps.executeUpdate();
	String a[] = absent.split(",");
	out.println("<center> <blink> <b>Attendance is successfully submitted </b></blink> <br />");
	int abs=0;
	for(String s : a)
	{
		if(s.length()>=5)
		{
		if(abs==0)
			out.print("Absentees ID's<br />");
		out.println(s);
		abs++;
		out.println("<br />");
			}
		}
	out.println("<br />Number of absentees : "+abs+"</center></body>");
	%>

</html>


