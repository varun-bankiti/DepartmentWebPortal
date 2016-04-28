<%@page import="java.util.Date,java.text.SimpleDateFormat,java.sql.*,java.util.LinkedList"%>
<%@page errorPage="errors.jsp" %>
<%
String user = (String)session.getAttribute("user");
if(user==null)
	out.print(user.length());
else if(!(session.getAttribute("access_lvl").toString()).equals("3"))
	out.print(9/0);
%>
<jsp:include page="fac_top.jsp"  />
<div class="body">
		<div id="notices_menu">
			<jsp:include page="databaseSideMenu.jsp" />
		</div>
		<div id="notices">
		<%
		Connection con = null;
		Class.forName("com.mysql.jdbc.Driver");
		con= DriverManager.getConnection("jdbc:mysql://localhost/cse?user=root&password=cse");
		PreparedStatement ps = null;
		String qry = "SELECT name,subject FROM faculty WHERE fac_id=?";
		ps = con.prepareStatement(qry);
		ps.setString(1,user);
		ResultSet rs = ps.executeQuery();
		rs.next();
		String tempSubject[]  = rs.getString(2).split(",");
		LinkedList<String> classes = new LinkedList<String>();
		for(String subject : tempSubject)
			{
				String cls = subject.split("-")[0];
				if(!classes.contains(cls))
					classes.add(cls);
				}
		Object [] classes1 = classes.toArray();
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
		String date = sdf.format(d);
		%>
		<div id="values">
		<table width="800px" cellpadding="0px" align="center">	<tr height="35px" align="center"><td bgcolor="#DDC5FE">Faculty :<b><%=rs.getString(1)%> </b></td>
		<td bgcolor="#DDF0FF">Class : 
		<select name="cls" id="clss">
			<option value="None">Select a class:</option>
			<%
			for(int i=0;i<classes1.length;i++)
			{
				out.println("<option value="+((String)classes1[i])+">"+((String)classes1[i])+"</option>");
				}
			%>

		</select></td>
		<td bgcolor="#DDC5FE">From : <input type="text" size="12" id="inputField1"  onclick="calender(this.id)" readonly="true" value="29-07-2013" name="fromDate" /></td><td bgcolor="#DDF0FF"> To : <input type="text" size="12" id="inputField" value=<%=date%> name="toDate"  onclick="calender(this.id)" /></td></tr></table>
		<center> <input type="button" value="Get Report" onClick="statisticsValidation()"/>
		<br />
				<div id="statisticsReport"></div>
</center> 
		</div>
		</div>


