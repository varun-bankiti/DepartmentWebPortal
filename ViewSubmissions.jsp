<%@ page import="java.sql.*"%>
<%
try{
	Connection con = null;
	Class.forName("com.mysql.jdbc.Driver");
	con= DriverManager.getConnection("jdbc:mysql://localhost/cse?user=root&password=cse");
	PreparedStatement ps = null;
	String qry;
	String id=request.getParameter("id");
	qry="select * from assignment_submits where assignment_id=?";
	ps=con.prepareStatement(qry);
	String filePath = "\\Portal\\Assignment_Submits\\";
	ps.setString(1,id);
	ResultSet result=ps.executeQuery();
	int count=0;
	%>
	<center><h2>Submission Details of <%=id%></h2><table border=2>
	<tr><td width=150>Student ID</td><td width=200>Attachment</td><td width=100>Time</td></tr>
	<%while(result.next()){
		count++;
		out.println("<tr><td>"+result.getString(2)+"</td><td><a href='"+filePath+result.getString(3)+"'>"+result.getString(3)+"</a></td><td>"+result.getString(4)+"</td></tr>");
		}
}
catch(Exception e){out.println(e);}

%>
