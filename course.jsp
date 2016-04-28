<%@page import="java.sql.*, java.util.Date,java.util.*,java.util.Calendar,java.text.*, java.util.TreeMap"%>
<%

String user=(String)session.getAttribute("user");
if(user!=null){
    int access_lvl=(Integer)session.getAttribute("access_lvl");
%>
		<%
		Connection con = null;
		Class.forName("com.mysql.jdbc.Driver");
		con= DriverManager.getConnection("jdbc:mysql://localhost/cse?user=root&password=cse");
		PreparedStatement ps = null;
		String qry;
		ResultSet result;
		LinkedList<String> course_ids = new LinkedList<String>();
		LinkedList<String> courses = new LinkedList<String>();
		if(access_lvl==1){
				qry="select * from student where stu_id=?";
				ps=con.prepareStatement(qry);
				ps.setString(1,user);
				result = ps.executeQuery();
				result.next();
				String year=result.getString("course");
				qry="select * from courses where year=?";
				ps=con.prepareStatement(qry);
				ps.setString(1,year);
				ResultSet result_courseid = ps.executeQuery();
				while(result_courseid.next())
				{
					 course_ids.add(result_courseid.getString(1));
					 courses.add(result_courseid.getString(2));
				 }
			}
		else if(access_lvl==3){
			qry = "SELECT subject FROM faculty WHERE fac_id=?";
				ps = con.prepareStatement(qry);
				ps.setString(1,user);
				ResultSet coursesRe = ps.executeQuery();
				coursesRe.next();
				String tempSubject[]  = coursesRe.getString(1).split(",");
				
				for(String subject : tempSubject)
					{
						String sub = subject.split("-")[1];
						if(!course_ids.contains(sub))
							course_ids.add(sub);
						}
				Object [] subs = course_ids.toArray();
				for(int i=0;i<subs.length;i++){
						qry = "SELECT course FROM courses WHERE course_id=?";
						ps = con.prepareStatement(qry);
						ps.setString(1,(String)subs[i]);
						coursesRe = ps.executeQuery();
						coursesRe.next();
						courses.add(coursesRe.getString(1));
							}
			
			
			}
		String pag=(String)request.getParameter("page");
		String temp=request.getParameter("course");
		String course;
		if(temp==null)
			course=(String)course_ids.getFirst();
		else
			course =temp;
		session.setAttribute("course",course);
		
		if(access_lvl==1){
		%>
		<jsp:include page="top.jsp"/>
		<%}else if(access_lvl==3){%>
		<jsp:include page="top.jsp"/><%}%>
			<div class="body">
				<div id="notices_menu">
					<h2 style="text-align:center;margin-top:10px;"><% qry="select course from courses where course_id=?";ps=con.prepareStatement(qry);ps.setString(1,course);result=ps.executeQuery();result.next(); out.println(result.getString(1)); %><hr></h2>
					<ul>
					<li><% out.println("<a href='course.jsp?course="+course+"&page=Discription'>");%>Description</a></li>
					<li><% out.println("<a href='course.jsp?course="+course+"&page=Syllabus'>");%>Syllabus</a></li>
					<li><% out.println("<a href='course.jsp?course="+course+"&page=Resources'>");%>Resources</a></li>
					<li><% out.println("<a href='course.jsp?course="+course+"&page=Discussion'>");%>Discussion</a></li>
					<li><% out.println("<a href='course.jsp?course="+course+"&page=Assignments'>");%>Assignments</a></li>
					<li><% out.println("<a href='course.jsp?course="+course+"&page=Marks'>");%>Marks</a></li>
					</ul>
				</div>
				<div id="notices">
					<%
					int a=(Integer)session.getAttribute("access_lvl");
					if((pag==null)||(pag.equals("Discussion"))){%>
					<jsp:include page="discussion.jsp"/>
					<%}
					else if(pag.equals("Syllabus")){%>
					<jsp:include page="syllabus.jsp"/>
					<%}
					else if(pag.equals("Resources")){try{%>
					<jsp:include page="resources.jsp"/>
					<%}catch(Exception e){out.println(e);}}
					else if(pag.equals("Discription")){%>
					<jsp:include page="discription.jsp"/>
					<%}
					else if(pag.equals("Assignments")){%>
					<jsp:include page="assignments.jsp"/>
					<%}
					
					else if(pag.equals("Marks")){
						if(a==1){
							%><jsp:include page="stuMarks.jsp"/><%
							}
						else{
							%><jsp:include page="marks1.jsp"/><%
							}
						}%>
				</div>
			</div>
			</div><CENTER><div id="footer" style="height:30px;width:1000px;color:white;text-shadow:2px 2px 5px red;font-size:18px;">Copyright &copy <a href="http://cse.rkv.rgukt.in" style="text-decoration:none;color:white;">CS-RKV</a> 2013</div></CENTER>

<%
}
else{
String site = new String("index.jsp");
response.setStatus(response.SC_MOVED_TEMPORARILY);
response.setHeader("Location", site);
    
}

%>
