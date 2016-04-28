<%@page import="java.sql.*, java.util.Date,java.util.*,java.util.Calendar,java.text.*, java.util.TreeMap"%>
<%@page errorPage="errors.jsp" %>
<%
		String user = (String)session.getAttribute("user");
		Connection con = null;
		Class.forName("com.mysql.jdbc.Driver");
		con= DriverManager.getConnection("jdbc:mysql://localhost/cse?user=root&password=cse");
		PreparedStatement ps = null;
		String qry;
		LinkedList<String> course_ids = new LinkedList<String>();
		LinkedList<String> courses = new LinkedList<String>();
		qry="select * from course_registered where stu_id=?";
		ps=con.prepareStatement(qry);
		ps.setString(1,user);
		ResultSet result_courseid = ps.executeQuery();
		ResultSet result;
		while(result_courseid.next())
		{
			String tempCourseId = result_courseid.getString(2);
			 qry="select * from courses where course_id=?";
			ps=con.prepareStatement(qry);
			 ps.setString(1,tempCourseId);
			 ResultSet row_courses = ps.executeQuery();
			 row_courses.next();
			 course_ids.add(tempCourseId);
			 courses.add(row_courses.getString(2));
		 }
		String pag=(String)request.getParameter("page");
		String temp=request.getParameter("course");
		String course;
		if(temp==null)
			course=(String)course_ids.getFirst();
		else
			course =temp;
		session.setAttribute("course",course);
		%>
	<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
	<html xml:lang="en" xmlns="http://www.w3.org/1999/xhtml" lang="en"><head>
	<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<title>CS-RKV</title>

	<link rel="stylesheet" href="css/student1.css" media="screen,print">
	<script type="text/javascript" src="js/student.js"></script>
	<script>
	function selstar(o,val)
	{
	for(var x=1;x<=val;x++)
		document[o+x].src="star2.gif";
	}
	function remstar(o,val)
	{
	for(var x=1;x<=val;x++)
		document[o+x].src="star1.gif";
	}
	function hidestar(o){
		for(var x=1;x<=5;x++)
		document[o+x].style.display="none";
		}
	function setrate(val,ansr_id)
	{
		save_rating=new XMLHttpRequest();
		save_rating.onreadystatechange=function()
		{
			if (save_rating.readyState==4 && save_rating.status==200){
				var x='i'+ansr_id;
				var y='j'+ansr_id;
				selstar(x,save_rating.responseText);
				hidestar(y);
				}
		}
		url="save_rating.jsp?value="+val+"&ansr_id="+ansr_id;
		save_rating.open("GET",url,true);
		save_rating.send();
		}
	function show_ansdiv(div){
		document.getElementById(div).style.display="block";
		document.getElementById(div+"s").style.display="none";
		document.getElementById(div+"h").style.display="block";
	}
	function hide_ansdiv(div){
		document.getElementById(div).style.display="none";
		document.getElementById(div+"s").style.display="block";
		document.getElementById(div+"h").style.display="none";
	}	
	function save_ans(ques_id){ 
	answer=document.getElementById("new_ansv_"+ques_id).value;
	save_ans=new XMLHttpRequest();
	save_ans.onreadystatechange=function()
	{
		if (save_ans.readyState==4 && save_ans.status==200){
				if(save_ans.responseText==1){
					document.getElementById("new_ans_"+ques_id).innerHTML="Answer Posted Successfully";
					}
			}
	}
	url="save_ans.jsp?answer="+answer+"&ques_id="+ques_id;
	save_ans.open("GET",url,true);
	save_ans.send();
	}
	</script>
	</head>

	<body id="body"> <!-- body -->
		<div id="container"><!-- container -->
			<div class="head">
			<div id="logo">
				<div id="img"></div>
				<div id="search"><h1><%out.println(user); %><a href="logout.jsp">Logout</a></h1></div>
			</div>
			<div id="menu">
			<link rel="stylesheet" href="css/menu.css">
			<script type="text/JavaScript" src="js/menu.js"></script>

			<ul id="qm0" class="qmmc" style="margin-top:-5px;">

				<li><a href="javascript:void(0)" >Home</a></li>
				<li><a class="qmparent" href="javascript:void(0)">Academics</a>
					<ul>
					<li><a href="javascript:void(0)">Curriculam &nbsp;&nbsp;</a></li>
					<li><a href="javascript:void(0)">TimeTable</a></li>
					<li><a href="javascript:void(0)">Notices</a></li>
					<li><a href="javascript:void(0)">Other</a></li>
					</ul></li>

					<li><a class="qmparent" href="course.jsp">Courses</a>

					<ul>
					<%
					int i=0;
					while(i<courses.size()){
						out.println("<li><a href='course.jsp?course="+course_ids.get(i)+"'>"+courses.get(i)+"</a></li>");
						i++;
						}
					%>
					<li><a href="Others">Others &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
					</ul></li>


	<li><a class="qmparent" href="javascript:void(0)">Events</a>

		<ul>
		<li><a href="javascript:void(0)">Academic</a></li>
		<li><a href="javascript:void(0)">Cultural</a></li>
		<li><a href="javascript:void(0)">Photo Gallery</a></li>
		<li><a href="javascript:void(0)">More</a></li>
		</ul></li>

	<li><a class="qmparent" href="javascript:void(0);">Student Corner</a>

		<ul>
		<li><a href="javascript:void(0);">Coding Club</a></li>
		<li><a href="javascript:void(0);">Technical Club</a></li>
		<li><a href="javascript:void(0);">GK Club</a></li>
		<li><a href="javascript:void(0);">Communication Club</a></li>
		</ul></li>

	<li><a class="qmparent" href="javascript:void(0);">Career</a>

		<ul>
		<li><a href="javascript:void(0);">Placements</a></li>
		<li><a href="javascript:void(0);">GATE</a></li>
		</ul></li>

<li class="qmclear">&nbsp;</li></ul>
<script type="text/javascript">qm_create(0,false,200,0,'lev2',false,false,false,true);</script><!--[END-QM0]-->

							</div>
			</div>
