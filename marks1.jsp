<%@page import="java.sql.*,java.util.Date,java.text.SimpleDateFormat,java.util.LinkedList"%>
<%@page errorPage="errors.jsp" %>
<%
String user = (String)session.getAttribute("user");
if(user==null)
	out.print(user.length());
else if(!(session.getAttribute("access_lvl").toString()).equals("3"))
	out.print(9/0);
%>
<%
	Connection con = null;
    Class.forName("com.mysql.jdbc.Driver");
    con= DriverManager.getConnection("jdbc:mysql://localhost/cse?user=root&password=cse");
    PreparedStatement ps = null;
	String qry = "SELECT name FROM faculty WHERE fac_id=?";
	ps = con.prepareStatement(qry);
	ps.setString(1,user);
	ResultSet rs = ps.executeQuery();
	rs.next();
%>
			
					<center><table width="800px" cellpadding="0px" ><tr height="35px" align="center"><td bgcolor="#DDC5FE">Faculty :<b><%=rs.getString(1)%> </b></td>
		<td bgcolor="#DDF0FF">Class : 
		<select name="cls" id="clss">
			<option value="None">Select a class:</option>
			<%
			qry = "SELECT subject FROM faculty WHERE fac_id=?";
			ps = con.prepareStatement(qry);
			ps.setString(1,user);
			ResultSet courses = ps.executeQuery();
			courses.next();
			String tempSubject[]  = courses.getString(1).split(",");
			LinkedList<String> subjects = new LinkedList<String>();
			LinkedList<String> classes = new LinkedList<String>();
			for(String subject : tempSubject)
				{
					String sub = subject.split("-")[1];
					String cls = subject.split("-")[0];
					if(!subjects.contains(sub))
						subjects.add(sub);
					if(!classes.contains(cls))
						classes.add(cls);
					}
			Object [] classes1 = classes.toArray();
			for(int i=0;i<classes1.length;i++)
				{
					out.println("<option value="+((String)classes1[i])+">"+((String)classes1[i])+"</option>");
					}
			%>
		</select></td>
		<td bgcolor="#DDC5FE">
		Exam : <select name="exam" id="exam">
			<option value="None">Select a Exam:</option>
			<option value="cat1">CAT-1</option>
			<option value="cat2">CAT-2</option>
			<option value="cat3">CAT-3</option>
		</select></td>
		<td bgcolor="#DDF0FF">
		Subject : <select name="subject" id="subject">
			<option value="None">Select a Subject:</option>
			<%
			Object [] subjects1 = subjects.toArray();
			for(int i=0;i<subjects1.length;i++)
				{
					qry = "SELECT course FROM courses WHERE course_id=?";
					ps = con.prepareStatement(qry);
					ps.setString(1,(String)subjects1[i]);
					courses = ps.executeQuery();
					courses.next();

					out.println("<option value="+courses.getString(1)+">"+courses.getString(1)+"</option>");
					}
			%>
		</select></td></tr></table> </tr></table> 
		<input type="button" value="Get details" onclick="marks()">
		<br /><br /></center>
		<div id="studentDetails" width="800px" height="400px"><center>Student Details will display here</center>
		</div>
			</div>	 
  

