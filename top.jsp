<%-- 
    Document   : top
    Created on : 20 Aug, 2013, 10:52:22 PM
    Author     : Varun
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>CS-RKV</title>
    <%@page import="java.sql.*, java.util.Date,java.util.*,java.util.Calendar,java.text.*, java.util.TreeMap"%>

<script>
</script>
<%			
String user = (String)session.getAttribute("user");
Connection con = null;
Class.forName("com.mysql.jdbc.Driver");
con= DriverManager.getConnection("jdbc:mysql://localhost/cse?user=root&password=cse");
PreparedStatement ps = null;
String qry;
	if(user==null){%>
		<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html><head>
    <title>CS-RKV</title>
        <link rel="stylesheet" href="cse/style_900.css" media="screen,print">
		<script type="text/javascript" src="cse/slide.js"></script>
		<link rel="stylesheet" href="cse/styles.css" media="screen,print"> 
       <script type="text/javascript" src="cse/plugins/jquery.js"></script>
     <script type="text/javascript" src="cse/plugins/cycle-plugin.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
	
	$('#fade').cycle();
	});

</script>
    <style type="text/css">

#fade{
width: 910px;
height: 180px;
border: 0px solid orange;
padding: 5px;
border-radius:20px;
}   
    </style>
<script type="text/javascript">
function login()
{
	uname=document.getElementById("uname").value;
	pwd=document.getElementById("pwd").value;
	login_check=new XMLHttpRequest();
	login_check.onreadystatechange=function()
	{
		if (login_check.readyState==4 && login_check.status==200){
			if(login_check.responseText==1){
				window.location.href="welcome.jsp";
				}
			else{
				document.getElementById("info").innerHTML="<center><font color='red'>Invalid Username/Password</font></center>";
				}
			}
	}
	url="check.jsp?uname="+uname+"&pwd="+pwd;
	login_check.open("GET",url,true);
	if ((uname=="")||(pwd=="")){
		if(uname==""){document.getElementById("uname").focus(); document.getElementById("info").innerHTML="<center><font color='red'>Please Enter Username</font></center>";}
		else{document.getElementById("pwd").focus(); document.getElementById("info").innerHTML="<center><font color='red'>Please Enter Password</font></center>";}
		}
	else login_check.send();
	}


     function showMenu(menuName) {
	if(menuName == "institute")
	{
		document.getElementById('sub_menu_institute').style.display = "block";
		document.getElementById('main_institute').style.background= "url(imgs/24.gif)";
		document.getElementById('sub_menu_acads').style.display = "none";
		document.getElementById('sub_menu_research').style.display = "none";
		document.getElementById('sub_menu_admissions').style.display = "none";
		document.getElementById('sub_menu_people').style.display = "none";
		document.getElementById('sub_menu_campuslife').style.display = "none";

		document.getElementById('main_acads').style.background = "none";
		document.getElementById('main_admissions').style.background = "none";
		document.getElementById('main_research').style.background = "none";
		document.getElementById('main_people').style.background = "none";
		document.getElementById('main_campuslife').style.background = "none";
		document.getElementById('main_media').style.background = "none";

		document.getElementById('main_institute').style.color = "black";
       
     
	}
	else if (menuName == "acads")
	{
		document.getElementById('sub_menu_acads').style.display= "block";
		document.getElementById('sub_menu_acads').style.background = "none";
		document.getElementById('sub_menu_institute').style.display = "none";
		document.getElementById('sub_menu_research').style.display = "none";
		document.getElementById('sub_menu_admissions').style.display = "none";
    document.getElementById('sub_menu_people').style.display = "none";
    document.getElementById('sub_menu_campuslife').style.display = "none";

     document.getElementById('main_institute').style.background = "none";
        document.getElementById('main_acads').style.background = "url(imgs/24.gif)";
        document.getElementById('main_admissions').style.background = "none";
            document.getElementById('main_research').style.background = "none";
            document.getElementById('main_people').style.background = "none";
		document.getElementById('main_campuslife').style.background = "none";
    document.getElementById('main_media').style.background = "none";
//    document.getElementById('mImg').src="/themes/iiit-july-1/homePage/images/mImg2.jpg";
		document.getElementById('main_acads').style.color = "black";

	}
	else if (menuName == "admissions")
        {
 	        document.getElementById('sub_menu_acads').style.display= "none";
                document.getElementById('sub_menu_institute').style.display = "none";
                document.getElementById('sub_menu_research').style.display = "none";
                document.getElementById('sub_menu_admissions').style.display = "block";
                document.getElementById('sub_menu_admissions').style.background = "none";
                document.getElementById('sub_menu_people').style.display = "none";
    document.getElementById('sub_menu_campuslife').style.display = "none";

                 document.getElementById('main_institute').style.background = "none";
                    document.getElementById('main_acads').style.background = "none";
                    document.getElementById('main_admissions').style.background = "url(imgs/24.gif)";
                        document.getElementById('main_research').style.background = "none";
                        document.getElementById('main_people').style.background = "none";
		document.getElementById('main_campuslife').style.background = "none";
  //  document.getElementById('mImg').src="/themes/iiit-july-1/homePage/images/mImg3.jpg";
		document.getElementById('main_acads').style.color = "black";
    document.getElementById('main_media').style.background = "none";

	}
	 else if (menuName == "research")
        {
                document.getElementById('sub_menu_acads').style.display= "none";
                document.getElementById('sub_menu_institute').style.display = "none";
                document.getElementById('sub_menu_research').style.display = "block";
                document.getElementById('sub_menu_admissions').style.display = "none";
                document.getElementById('sub_menu_people').style.display = "none";
    document.getElementById('sub_menu_campuslife').style.display = "none";

                 document.getElementById('main_institute').style.background = "none";
                    document.getElementById('main_acads').style.background = "none";
                    document.getElementById('main_admissions').style.background = "none";
                        document.getElementById('main_research').style.background = "url(imgs/24.gif)";
                        document.getElementById('main_people').style.background = "none";
		document.getElementById('main_campuslife').style.background = "none";
		document.getElementById('main_research').style.color = "black";
    document.getElementById('main_media').style.background = "none";

        }
	 else if (menuName == "people")
        {
                document.getElementById('sub_menu_acads').style.display= "none";
                document.getElementById('sub_menu_institute').style.display = "none";
                document.getElementById('sub_menu_research').style.display = "none";
                document.getElementById('sub_menu_admissions').style.display = "none";
                document.getElementById('sub_menu_people').style.display = "block";
                 document.getElementById('sub_menu_people').style.background = "";
    document.getElementById('sub_menu_campuslife').style.display = "none";

                 document.getElementById('main_institute').style.background = "none";
                    document.getElementById('main_acads').style.background = "none";
                    document.getElementById('main_admissions').style.background = "none";
                    document.getElementById('main_research').style.background = "none";
                    document.getElementById('main_people').style.background ="url(imgs/24.gif)";
                    document.getElementById('main_campuslife').style.background = "none";
    document.getElementById('main_media').style.background = "none";
		document.getElementById('main_people').style.color = "black";

        }


   else if (menuName == "campuslife")
   {
     document.getElementById('sub_menu_acads').style.display= "none";
     document.getElementById('sub_menu_institute').style.display = "none";
     document.getElementById('sub_menu_research').style.display = "none";
     document.getElementById('sub_menu_admissions').style.display = "none";
     document.getElementById('sub_menu_people').style.display = "none";
     document.getElementById('sub_menu_campuslife').style.display = "block";

     document.getElementById('main_institute').style.background = "none";
     document.getElementById('main_acads').style.background = "none";
     document.getElementById('main_admissions').style.background = "none";
     document.getElementById('main_research').style.background = "none";
     document.getElementById('main_people').style.background = "none";
     document.getElementById('main_campuslife').style.background = "url(imgs/24.gif)";
    document.getElementById('main_media').style.background = "none";
    //document.getElementById('mImg').src="/themes/iiit-july-1/homePage/images/mImg6.jpg";
		document.getElementById('main_campuslife').style.color = "black";

   }



	
    }
 
    </script>
  </head><body id="body"> <!-- body -->
     <div id="container"><!-- container -->
            
            <div id="header">
              <div id="header_tree"></div>
            
    <div id="header_search">
		 
</div>
        </div>

        <!--div id=full_name-->



<!--<div id=full_name_right>
<b class="rtop">
  <b class="r4">  -->
<!--</b> <b class="r2"></b> <b class="r3"></b> <b class="r4">-->
<!--</b> -->
<!--content goes here -->
<!--<span id=full_text>
Accredited at Grade A by NAAC
</span>
</div> -->
<!--/div-->

        <div id="featured_main"> <!-- featured_main -->
        <div id="menu_main"> <!-- menu_main -->
<!--<b class="rtop">
  <b class="r1"></b> <b class="r2"></b> <b class="r3"></b> <b class="r4"></b>
</b>-->
<b>
          <div id="top_menu"> <!-- top_menu -->
          <div id="top_menu_left"></div>
            <div id="menu_list">
        
            <a class="mainmenu" onfocus="if(this.blur)this.blur()" onmouseover="showMenu('institute');"  id="main_institute" href="index.jsp">Home</a>
            </div>
     
            <div id="menu_list">
              <a class="mainmenu" onfocus="if(this.blur)this.blur()" onmouseover="showMenu('acads');" id="main_acads" href="index.jsp?page=Curriculum">Academics </a>
            </div>
        
            <div id="menu_list">
              <a class="mainmenu" onfocus="if(this.blur)this.blur()" onmouseover="showMenu('admissions');" id="main_admissions" href="index.jsp?page=FacultyDetails">Campus </a>
            </div>
    
    
            <div id="menu_list">
              <a class="mainmenu" onfocus="if(this.blur)this.blur()" onmouseover="showMenu('research');" id="main_research" href="index.jsp?page=PhotoGallery">Photo Gallery </a>
            </div>
            <div id="menu_list">
              <a class="mainmenu" onfocus="if(this.blur)this.blur()" onmouseover="showMenu('people');" id="main_people" href="index.jsp?page=FacultyAchievements">Achievements </a>
            </div>
            <div id="menu_list">
              <a class="mainmenu" onfocus="if(this.blur)this.blur()" onmouseover="showMenu('campuslife');" id="main_campuslife" href="index.jsp?page=ContactUs">Contact Us</a>
</div>
          </div> <!-- //top_menu -->
          </b>
          <div id="top_menu_right"></div>
</div>
	<div id="sub_menu_bar">
<div id="sub_menu_institute">
               <ul>
              </ul>
             </div>
             <div id="sub_menu_acads">
              <ul>
                <li><a onfocus="if(this.blur)this.blur()" id="sub" href="index.jsp?page=AboutCSE">About CSE</a></li>
                <li><a onfocus="if(this.blur)this.blur()" id="sub" href="index.jsp?page=Curriculum">Curriculum</a></li>
                <li><a onfocus="if(this.blur)this.blur()" id="sub" href="index.jsp?page=AcademicCalendar">Academic Calendar</a></li>
              </ul>
              </div>
              <div id="sub_menu_admissions">
              <ul>
                <li>&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp</li>
                <li><a onfocus="if(this.blur)this.blur()" id="sub" href="index.jsp?page=FacultyDetails">Faculty</a></li>
                <li><a onfocus="if(this.blur)this.blur()" id="sub" href="index.jsp?page=Timetable">Timetable</a></li>
                
              </ul>
              </div>
              <div id="sub_menu_research">
              <ul>
              </ul>
              </div>
              <div id="sub_menu_people">
              <ul>
                <li><a onfocus="if(this.blur)this.blur()" id="sub" href="index.jsp?page=FacultyAchievements" >Faculty</a></li>
                <li><a onfocus="if(this.blur)this.blur()" id="sub" href="index.jsp?page=StudentAchievements">Students</a></li>
                
              </ul>
              </div>

<div id="sub_menu_campuslife">
				
              </div>
            </div>
			
</head>

		
		
		
		<%}
	else{	
		int access_lvl=(Integer)session.getAttribute("access_lvl");
		if(access_lvl==1){
				
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

				%>
			<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
			<html xml:lang="en" xmlns="http://www.w3.org/1999/xhtml" lang="en"><head>
			<head>
			<meta http-equiv="content-type" content="text/html; charset=UTF-8">
			<title>CS-RKV</title>

			<link rel="stylesheet" href="css/student1.css" media="screen,print">
			<script type="text/javascript" src="js/student.js"></script>
			<script>
			
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
						<li><a class="qmparent" href="index.jsp?page=Curriculum">Academics</a>
							<ul>
							<li><a href="index.jsp?page=Curriculum">Curriculam &nbsp;&nbsp;</a></li>
							<li><a href="index.jsp?page=Timetable">TimeTable</a></li>
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
							<li><a href="#">Others &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
							</ul></li>


			<li><a class="qmparent" href="AcademicEvents.jsp">Events</a>

				<ul>
				<li><a href="AcademicEvents.jsp">Academic</a></li>
				<li><a href="javascript:void(0)">Cultural</a></li>
				<li><a href="index.jsp?page=PhotoGallery">Photo Gallery</a></li>
				<li><a href="javascript:void(0)">More</a></li>
				</ul></li>

			<li><a class="qmparent" href="TechnicalClub.jsp">Student Corner</a>

				<ul>
				<li><a href="TechnicalClub.jsp">Technical Club</a></li>
				<li><a href="javascript:void(0);">Coding Club</a></li>
				<li><a href="javascript:void(0);">GK Club</a></li>
				<li><a href="javascript:void(0);">Communication Club</a></li>
				</ul></li>

			<li><a class="qmparent" href="javascript:void(0);">Career</a>

				<ul>
				<li><a href="javascript:void(0);">Placements</a></li>
				<li><a href="javascript:void(0);">GATE</a></li>
				</ul></li>
			<li class="qmclear">&nbsp;</li>
		</ul>
				
		<script type="text/javascript">qm_create(0,false,200,0,'lev2',false,false,false,true);</script><!--[END-QM0]-->
			<div style="float:right;margin-top:-30px;text-align:center;margin-right:10px;"><a style="width:80px;height:40px;padding:15px 0px;color:#313174;font-family:Comic Sans MS;font-size:16px;text-decoration:none;font-weight:bold;text-align:center;" href="logout.jsp">Logout</a></li><ul></div>
								</div>
					</div>

		<%}
		else if(access_lvl==3){%>
				<%String name=(String)session.getAttribute("name");%>
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
								<li><a class="qmparent" href="index.jsp?page=Curriculum">Academics</a>
									<ul>
									<li><a href="index.jsp?page=Curriculum">Curriculam &nbsp;&nbsp;</a></li>
							<li><a href="index.jsp?page=Timetable">TimeTable</a></li>
							<li><a href="javascript:void(0)">Other</a></li>
							
									</ul></li>

							<li><a class="qmparent" href="#">Courses</a>

								<ul>
								<%
								
								qry = "SELECT subject FROM faculty WHERE fac_id=?";
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
			
			
			
			
			<%}
	
	}%>

</html>
