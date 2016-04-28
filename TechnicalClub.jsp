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
<center><h2><a href="TechnicalClub/Aptitude_CSE_Week2.pdf" target=blank>Techinical Test-2 Key</a></h2>
</center>
	<style>
	#details{font-family:"Lucida Sans Unicode", "Lucida Grande", Sans-Serif;font-size:12px;text-align:left;border-collapse:collapse;margin:20px;}#details th{border:1px solid white;font-size:13px;font-weight:normal;background:#b9c9fe;border-top:2px solid #aabcfe;border-bottom:1px solid #fff;color:#039;padding:8px;}#details td{text-align:center;border:1px solid white;background:#e8edff;border-bottom:1px solid #fff;color:#669;border-top:1px solid transparent;padding:8px;}#details tr:hover td{background:#d0dafd;color:#339;}
	</style>
	<br><br>
	<h3 align=center>Next week syllabus will be updated soon.</h3>
<br>
<h3 align=right>With Regards <br>Technical TeamCS-RKV</h3>
</div></div><CENTER><div id="footer" style="height:30px;width:1000px;color:white;text-shadow:2px 2px 5px red;font-size:18px;">Copyright &copy <a href="http://cse.rkv.rgukt.in" style="text-decoration:none;color:white;">CS-RKV</a> 2013</div></CENTER>
<%}
else{
	String site = new String("index.jsp");
	response.setStatus(response.SC_MOVED_TEMPORARILY);
	response.setHeader("Location", site);
	}
	%>
