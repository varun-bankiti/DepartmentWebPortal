<%
String course=(String)session.getAttribute("course");
if(session.getAttribute("pageno")!=null){
	String s=(String)session.getAttribute("pageno");
	int pageNum=Integer.parseInt(s);
	String v=""+(pageNum-1);
	session.setAttribute("pageno",v);
	}
String site = new String("course.jsp?course="+course+"&page=Discussion");
response.setStatus(response.SC_MOVED_TEMPORARILY);
response.setHeader("Location", site);
%>
