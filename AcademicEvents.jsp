<%-- 
    Document   : index
    Created on : 20 Aug, 2013, 10:49:42 PM
    Author     : Varun
--%>
<%
String user=(String)session.getAttribute("user");
if(user!=null){
%>

<jsp:include page="top.jsp" />
<div id="content">
<center><h2>Teacher's Day Celebrations </h2>
<br>

<a href='TeachersDay.jsp' style="color:blue;font-size:20px;text-decoration:none;"><blink>Money Details</blink></a>
<br><br><br>
<img src="Invitation.jpg" width=600 height=500>
</center>

</div></div><CENTER><div id="footer" style="height:30px;width:1000px;color:white;text-shadow:2px 2px 5px red;font-size:18px;">Copyright &copy <a href="http://cse.rkv.rgukt.in" style="text-decoration:none;color:white;">CS-RKV</a> 2013</div></CENTER>
<%}
else{
	String site = new String("index.jsp");
	response.setStatus(response.SC_MOVED_TEMPORARILY);
	response.setHeader("Location", site);
	}
	%>
