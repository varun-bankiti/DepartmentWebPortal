<%@page import="java.sql.*, java.util.Date,java.util.*,java.util.Calendar,java.text.*, java.util.TreeMap"%>
<%
String user = (String)session.getAttribute("user");
if(user!=null){
	int access_lvl = (Integer)session.getAttribute("access_lvl");
	if (access_lvl==1){%>
		<jsp:include page="student.jsp" />
		<%}
	else if(access_lvl==3){%>
		<jsp:include page="faculty.jsp"/>
	<%
		}	
		%>
	</div><CENTER><div id="footer" style="height:30px;width:1000px;color:white;text-shadow:2px 2px 5px red;font-size:18px;">Copyright &copy <a href="http://cse.rkv.rgukt.in" style="text-decoration:none;color:white;">CS-RKV</a> 2013</div></CENTER>
<%}
else{
	String site = new String("index.jsp");
	response.setStatus(response.SC_MOVED_TEMPORARILY);
	response.setHeader("Location", site);
	}
%>

