<%@page import="java.sql.*, java.util.Date,java.util.*,java.util.Calendar,java.text.*, java.util.TreeMap"%>
<%
String user=(String)session.getAttribute("user");
if(user!=null){
%>
		<% 
		Connection con = null;
		Class.forName("com.mysql.jdbc.Driver");
		con= DriverManager.getConnection("jdbc:mysql://localhost/cse?user=root&password=cse");
		PreparedStatement ps = null;
		String qry;
		LinkedList<String> course_ids = new LinkedList<String>();
		LinkedList<String> courses = new LinkedList<String>();
		qry="select * from student where stu_id=?";
		ps=con.prepareStatement(qry);
		ps.setString(1,user);
		ResultSet result = ps.executeQuery();
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
		  String tem=request.getParameter("from");
			 int from;
			 if(tem==null)
				from=0;
			else{
				from=Integer.parseInt(tem);
			}
		%>
<jsp:include page="top.jsp"/>
			<div class="body">
				<div id="notices_menu">
					<h2 style="text-align:center;margin-top:10px;">Not!ces<hr></h2>
					<ul>
						<li><a href="student.jsp?from=4">Coordinator</a></li>
						<li><a href="student.jsp?from=3">Faculty</a></li>
						<li><a href="student.jsp?from=2">Class Rep.</a></li>
						<li><a href="student.jsp?from=5">Discussion</a></li>
					</ul>
				</div>
				<div id="notices" style="font-family:'Lucida Sans Unicode', 'Lucida Grande', Sans-Serif;font-size:10px;">
				<%
					qry="select * from student where stu_id=?";
					ps=con.prepareStatement(qry);
					ps.setString(1,user);
					ResultSet forClass=ps.executeQuery();
					forClass.next();
					String clas=forClass.getString(3);
					qry="select * from notices order by time desc";
					ps=con.prepareStatement(qry);
					ResultSet notices = ps.executeQuery();
					int noticeCount=0;
					%><table id='notice_disp' style='font-size:13px;font-family:"Comic Sans MS", cursive, sans-serif'  ><COLGROUP><COL WIDTH=150><COL WIDTH=700><COL WIDTH=100></COLGROUP><tr style='font-size:15px;font-weight:bold;background:url(imgs/q9.jpg);'><td width=150 align='center'>From:</td><td width=700 align='center'>Notice</td><td width=100>Posted On</td></tr>
					<%if(noticeCount==0) out.println("<tr height=60 style='background:url(imgs/b6.jpg);border-radius:10px;><td colspan=3>No Notices Found</td></tr>");
					while(notices.next()){
						if ((notices.getString(2).contains(user))||(notices.getString(2).equals("all"))||(notices.getString(2).equals("all_students"))||(notices.getString(2).contains(clas))){
							String noticeDate1 = notices.getString(4).substring(0,10);
								DateFormat qdf = new SimpleDateFormat("yyyy-MM-dd");
								Date  date = qdf.parse(noticeDate1);
								Date curDate = new Date();
								Calendar  c = Calendar.getInstance();
								Calendar  cc = Calendar.getInstance();
								c.setTime(date);
								cc.setTime(curDate);
								int count = 0;
								while(c.before(cc))
									{
										count++;
										c.add(Calendar.DATE,1);
										}
								String noticeDate=null;
								if(count==1)
									noticeDate = "Today "+notices.getString(4).substring(11,16);
								else if(count==2)
									noticeDate = "1day ago";
								else if(count>2 && count<=18)
									noticeDate = (count-1)+"days ago";
								else if(count>18 && count<=26)
									noticeDate = "3Weeks ago";
								else if(count>26 && count<=31)
									noticeDate = "1 Month ago";
								else if(count>31 && count<=62)
									noticeDate = "2 Months ago";
								else noticeDate = "few months ago";
							qry="select * from accounts where id=?";
							ps=con.prepareStatement(qry);
							ps.setString(1,notices.getString(3));
							ResultSet fromname=ps.executeQuery();
							fromname.next();
							String photo="";
							if(fromname.getInt(4)==3){
								qry="select * from faculty where fac_id=?";
								ps=con.prepareStatement(qry);
								ps.setString(1,notices.getString(3));
								ResultSet forPhoto=ps.executeQuery();
								forPhoto.next();
								photo=forPhoto.getString(5);
								}
							else if(fromname.getInt(4)==1){
								qry="select * from student where stu_id=?";
								ps=con.prepareStatement(qry);
								ps.setString(1,notices.getString(3));
								ResultSet forPhoto=ps.executeQuery();
								forPhoto.next();
								photo=forPhoto.getString(5);
								}
								
							if((from==4)&&(notices.getString(3).equals("CHANDU"))){
								noticeCount++;
                                if(noticeCount<=10)
									out.println("<tr  style='background:url(imgs/b6.jpg);'><td  valign='top'  align='left' >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src='"+photo+"' width=50 height=50><br><b>"+fromname.getString(2)+"</b></td><td style='line-height:25px;text-indent:50px;padding:10px;' valign='top'>"+notices.getString(5)+"</td><td valign='bottom'>"+noticeDate+"</td>");
								}
							else if((from==0)||(from==fromname.getInt(4))){
								noticeCount++;
                                if(noticeCount<=10)
								out.println("<tr  style='background:url(imgs/b6.jpg);border-radius:10px;'><td  valign='top'  align='left' >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src='"+photo+"' width=50 height=50><br><b>"+fromname.getString(2)+"</b></td><td style='line-height:25px;text-indent:50px;padding:10px;' valign='top'>"+notices.getString(5)+"</td><td valign='bottom'>"+noticeDate+"</td>");
							}
						}
					}
					
					if( noticeCount==0 ) out.println("<tr height=60px style='color:blue;font-size:15px;font-weight:bold;background:url(imgs/b6.jpg);border-radius:10px;><td colspan=3 align=center>No Notices Found</td></tr>");
					out.println("</table>");
				%>
				</div>
				</div>

<%}
else{
String site = new String("index.jsp");
response.setStatus(response.SC_MOVED_TEMPORARILY);
response.setHeader("Location", site);
    
}
    %>
