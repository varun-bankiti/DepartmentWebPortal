<%@page import="java.sql.*, java.util.Date,java.text.SimpleDateFormat,java.util.LinkedList"%>
<title>CS-RKV</title>
<%
String user = (String)session.getAttribute("user");
if(!(session.getAttribute("access_lvl").toString()).equals("3"))
	out.print(9/0);
if(user!=null){
%>
<%String name=(String)session.getAttribute("name");%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xml:lang="en" xmlns="http://www.w3.org/1999/xhtml" lang="en"><head>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>CS-RKV</title>
<link rel="stylesheet" type="text/css" media="all" href="jsdatepick-calendar/jsDatePick_ltr.min.css" />
<script type="text/javascript" src="jsdatepick-calendar/jsDatePick.min.1.3.js"></script>
<link rel="stylesheet" href="css/student1.css" media="screen,print">
<script type="text/javascript" src="js/student.js"></script>

<link rel="stylesheet" type="text/css" media="all" href="jsdatepick-calendar/jsDatePick_ltr.min.css" />
<script type="text/javascript" src="jsdatepick-calendar/jsDatePick.min.1.3.js"></script>
<script type="text/javascript">
function calender(idname){	
		new JsDatePick({
			useMode:2,
			target:idname,
			dateFormat:"%d-%m-%Y"
		});
	};
</script>
<script type="text/javascript">
	window.onload = function(){
		new JsDatePick({
			useMode:2,
			target:"inputField1",
			dateFormat:"%d-%m-%Y"
		});
}	
</script>
</head>

<body id="body"> <!-- body -->
	<div id="container"><!-- container -->
		<div class="head">
		<div id="logo">
			<div id="img"></div>
			<div id="search"><h3 style='margin-top:5px;float:right;'><% out.println("<img style='float:right;margin-top:5px;' src='Photos/"+user+"' width=80 height=80><br>&nbsp;"+user+"</h3></div>");%>
		</div>
		<div id="menu">

		<link rel="stylesheet" href="css/menu.css">
			<script type="text/JavaScript" src="js/menu.js"></script>

			<ul id="qm0" class="qmmc" style="margin-top:-5px;">

				<li><a href="welcome.jsp" >Home</a></li>
				<li><a class="qmparent" href="javascript:void(0)">Academics</a>
					<ul>
					<li><a href="javascript:void(0)">Curriculam &nbsp;&nbsp;</a></li>
					<li><a href="javascript:void(0)">TimeTable</a></li>
					<li><a href="faculty.jsp">Notices</a></li>
					</ul></li>

			<li><a class="qmparent" href="#">Courses</a>

				<ul>
				<%
				Connection con = null;
				Class.forName("com.mysql.jdbc.Driver");
				con= DriverManager.getConnection("jdbc:mysql://localhost/cse?user=root&password=cse");
				PreparedStatement ps = null;
				String qry = "SELECT subject FROM faculty WHERE fac_id=?";
				ps = con.prepareStatement(qry);
				ps.setString(1,user);
				ResultSet courses = ps.executeQuery();
				courses.next();
				String tempSubject[]  = courses.getString(1).split(",");
				LinkedList<String> subjects = new LinkedList<String>();
				for(String subject : tempSubject)
					{
						String sub = subject.split("-")[1];
						if(!subjects.contains(sub))
							subjects.add(sub);
						}
			Object [] subs = subjects.toArray();
				for(int i=0;i<subs.length;i++){
						qry = "SELECT course FROM courses WHERE course_id=?";
						ps = con.prepareStatement(qry);
						ps.setString(1,(String)subs[i]);
						courses = ps.executeQuery();
						courses.next();
						out.println("<li><a href='course.jsp?course="+subs[i]+"'>"+courses.getString(1)+"</a></li>");
							}
						out.println("<li><a href='#'> Others </a></li>");
				%>

				</ul></li>

			<li><a class="qmparent" href="#">Database</a>

				<ul>
				<li><a href="attendance.jsp">Attendance</a></li>
				<li><a href="marks.jsp">Marks</a></li>
				</ul></li>

			<li><a class="qmparent" href="#">Student Corner</a>

				<ul>
				<li><a href="codingClub.jsp">Coding Club</a></li>
				<li><a href="#">Technical Club</a></li>
				<li><a href="#">Gk Club</a></li>
				<li><a href="#">Communication Club</a></li>
				</ul></li>

			<li><a class="qmparent" href="#">Career</a>

				<ul>
				<li><a href="#">Placements</a></li>
				<li><a href="#">Gate</a></li>
				</ul></li>
<li class="qmclear">&nbsp;</li></ul>
<script type="text/javascript">qm_create(0,false,200,0,'lev2',false,false,false,true);</script><!--[END-QM0]-->
		<div style="float:right;margin-top:-30px;text-align:center;margin-right:10px;"><a style="width:80px;height:40px;padding:15px 0px;color:#313174;font-family:Comic Sans MS;font-size:16px;text-decoration:none;font-weight:bold;text-align:center;" href="logout.jsp">Logout</a></li><ul></div>
		</div>
		</div>
<%
}
else{
String site = new String("index.jsp");
response.setStatus(response.SC_MOVED_TEMPORARILY);
response.setHeader("Location", site);
    
}%>
    		
