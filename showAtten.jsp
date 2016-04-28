<%@page errorPage="errors.jsp" %>
<%
String user = (String)session.getAttribute("user");
if(user==null)
	out.print(user.length());
else if(!(session.getAttribute("access_lvl").toString()).equals("3"))
	out.print(9/0);
%>
<style type="text/css">
#report
{
font-family:"Trebuchet MS", Arial, Helvetica, sans-serif;
width:200px;
border-collapse:collapse;
align:center;
text-align:center;
frame:box;
}
#report th 
{
font-size:1.1em;
text-align:center;
padding-top:5px;
padding-bottom:4px;
background-color:#BCD670;
color:#ffffff;
}
#report td
{
font-size:1.0em;
text-align:center;
padding-top:5px;
padding-bottom:4px;
}
</style>
		<%@page import="java.sql.*"%>
		<% 
		String temp[] = request.getParameter("clsDate").split(",");
			Connection con = null;
			Class.forName("com.mysql.jdbc.Driver");
			con= DriverManager.getConnection("jdbc:mysql://localhost/cse?user=root&password=cse");
			PreparedStatement ps = null;
			String qry = "SELECT name,stu_id FROM student WHERE class=?";
			ps = con.prepareStatement(qry);
			ps.setString(1,temp[0]);
			ResultSet rs = ps.executeQuery();
			qry = "SELECT absent FROM attendance WHERE fac_id=? and class=? and date=?";
			ps = con.prepareStatement(qry);
			ps.setString(1,user);
			ps.setString(2,temp[0]);
			ps.setString(3,temp[1]);
			try
			{
			ResultSet absent = ps.executeQuery();
			int total = 0;
			absent.next();
			while(rs.next())
				total++;
			String[] absentees= absent.getString(1).split(",");
			out.println("<center>Total # of students : "+total);
			int a=0;
			int count=1;
			if(absentees[0].length()>5)
			{
			out.println("<table id='report'><th>S.No</th><th>Absentees IDs </th>");
			for(String stu : absentees)
				{
				if(stu.length()>5)
					{
					if(a%2==0)
						out.println("<tr bgcolor='#F4EAFF' ><td>"+(count++)+"</td><td>"+stu+"</td></tr>");
					else
					out.println("<tr bgcolor='#EBD8FA' ><td>"+(count++)+"</td><td>"+stu+"</td></tr>");
				a++;
					}
				}
			}
			else{out.println("<center>No absentees</center>");}
			out.println("<br />");
			String link = "editAtten.jsp?clss="+temp[0]+"&date="+temp[1];
			%>
			<a href=<%=link%>> Edit  </a> <%}catch(Exception e){out.print("<center>Attendance is not available</center>");}%>
			</center>


