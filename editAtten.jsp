<%@page errorPage="errors.jsp" %>
<%
String user = (String)session.getAttribute("user");
if(user==null)
	out.print(user.length());
else if(!(session.getAttribute("access_lvl").toString()).equals("3"))
	out.print(9/0);
%>
<style type="text/css">
#details
{
font-family:"Trebuchet MS", Arial, Helvetica, sans-serif;
width:700px;
border-collapse:collapse;
align:center;
text-align:center;
frame:box;
margin-top:-10;
}

#details th 
{
font-size:1.1em;
text-align:center;
padding-top:5px;
padding-bottom:4px;
background-color:#BCD670;
color:#ffffff;
}
#details td
{
font-size:1.0em;
text-align:center;
padding-top:5px;
padding-bottom:4px;
}
</style>
<jsp:include page="fac_top.jsp"  />
			<div id="notices_menu">
				<jsp:include page="databaseSideMenu.jsp" />
			</div>
			<div id="notices">
			<center>
		<%@page import="java.sql.*"%>
		<% 
			String temp1 = request.getParameter("clss")+" "+request.getParameter("date");
			Cookie cookie = new Cookie ("editAtten",temp1);
			cookie.setMaxAge(2 * 60 * 60);
			response.addCookie(cookie);
			Connection con = null;
			Class.forName("com.mysql.jdbc.Driver");
			con= DriverManager.getConnection("jdbc:mysql://localhost/cse?user=root&password=cse");
			PreparedStatement ps = null;
			String qry = "SELECT name FROM faculty WHERE fac_id=?";
			ps = con.prepareStatement(qry);
			ps.setString(1,user);
			ResultSet rs = ps.executeQuery();
			rs.next();
			out.println("<center><table width='700px' cellpadding='0px' >	<tr height='35px' align='center'><td bgcolor='#DDC5FE'>Faculty :<b>"+rs.getString(1)+"</b></td><td bgcolor='#DDF0FF'>Class :<input type=text readonly='true' id='clss' value="+request.getParameter("clss")+"></td><td bgcolor='#DDC5FE'>Date :<input type='text' id='date' readonly='true' value="+request.getParameter("date")+"></td></tr></table>");
			String temp[] = {request.getParameter("clss"),request.getParameter("date")};
			qry = "SELECT name,stu_id FROM student WHERE class=?";
			ps = con.prepareStatement(qry);
			ps.setString(1,temp[0]);
			rs = ps.executeQuery();
			qry = "SELECT absent FROM attendance WHERE fac_id=? and class=? and date=?";
			ps = con.prepareStatement(qry);
			ps.setString(1,user);
			ps.setString(2,temp[0]);
			ps.setString(3,temp[1]);
			ResultSet absent = ps.executeQuery();
			absent.next();
			String[] absentees= absent.getString(1).split(",");
			int a=0;
			out.print("<div id='attenReport'><form id='attendance'>");
			out.println("<table id='details' ><tr><th>Student Name</th><th>Student Id</th><th>Attendance Report</th></tr>");
			while(rs.next()) 
			{
				int check=0;
				for(String id : absentees)
				{
					if(id.equals(rs.getString(2)))
							{
								check=1;
								if((a%2)==0)
									{
									out.print("<tr bgcolor='#F4EAFF'><td>"+rs.getString(1)+"</td><td>"+rs.getString(2)+"</td><td><input type='checkbox' name="+rs.getString(2)+" /></td></tr>");
									a++;
									}
								else  
									{
									out.println("<tr bgcolor='#EBD8FA'><td>"+rs.getString(1)+"</td><td>"+rs.getString(2)+"</td><td><input type='checkbox' name="+rs.getString(2)+" /></td></tr>");
									a++;
										}
								}
					}
				if(check==0){
				if((a%2)==0)
				{
				out.print("<tr bgcolor='#F4EAFF'><td>"+rs.getString(1)+"</td><td>"+rs.getString(2)+"</td><td><input type='checkbox' name="+rs.getString(2)+" checked=' checked '/></td></tr>");
				a++;
				}
			else  
				{
				out.println("<tr bgcolor='#EBD8FA'><td>"+rs.getString(1)+"</td><td>"+rs.getString(2)+"</td><td><input type='checkbox' name="+rs.getString(2)+" checked=' checked '/></td></tr>");
				a++;
					}
				}
			}
			out.println("</table>");
		%>
<br /></form><input type='button' onclick='return editedAtten()' value='submit'></div><br />
			</center>


