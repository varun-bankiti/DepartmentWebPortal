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
	String exam = request.getParameter("exam");
	String subject = request.getParameter("subject");
	Connection con = null;
    Class.forName("com.mysql.jdbc.Driver");
    con= DriverManager.getConnection("jdbc:mysql://localhost/cse?user=root&password=cse");
    PreparedStatement ps = null;
	String qry = "SELECT name,stu_id FROM student WHERE class=?";
	ps = con.prepareStatement(qry);
	ps.setString(1,clss);
	ResultSet rs = ps.executeQuery();
	String [] marks = request.getParameter("marks").split(" ");
	int i=0;
	while(rs.next())
	{try{
	qry = "INSERT into internal_marks values(?,?,?,?,?,?)";
	ps = con.prepareStatement(qry);
	ps.setString(1,user);
	ps.setString(2,subject);
	ps.setString(3,clss);
	ps.setString(4,rs.getString(2));
	ps.setString(5,exam);
	ps.setString(6,marks[i]);
	ps.executeUpdate();
	i++;}catch(Exception e){out.println(e);}
		}
	out.println("<center> <blink> <b>Marks are successfully submitted </b></blink> <br />");
	%>
</html>

