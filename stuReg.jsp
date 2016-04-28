<%
String id = (String) session.getAttribute("id");
if(id!=null){
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html><head>
    <title>CS-RKV</title>
        <link rel="stylesheet" href="css/style_900.css" media="screen,print">
		<script type="text/javascript" src="js/slide.js"></script>
		<link rel="stylesheet" href="css/styles.css" media="screen,print"> 
       <script type="text/javascript" src="js/jquery.js"></script>
     <script type="text/javascript" src="js/cycle-plugin.js"></script>
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
function get_timetable()
{
	if(document.getElementById("class").value=="Sigma-5")
	document.getElementById("timetable").innerHTML="<table border='1' align='center'><tr align=center><td></td><td>8.30-10.25</td><td>10.30-12.30</td><td>1.15-3.15</td><td>3.15-5.15</td></tr>   <tr align=center><td>MON</td><td colspan=2>COA LAB</td><td>PPL</td><td>COA</td></tr>  <tr align=center><td>TUE</td><td>AOA</td><td>TOC</td><td colspan=2>BREADTH</td></tr>   <tr align=center><td>WED</td><td>PPL </td><td>COA</td><td>TOC</td><td>AOA</td></tr>  <tr align=center><td>THU</td><td>COA</td><td>TOC</td><td colspan=2>PPL LAB</td></tr>    <tr align=center><td>FRI</td><td>PPL</td><td>AOA</td><td colspan=2>BREADTH</td></tr></table>";
	else if(document.getElementById("class").value=="Sigma-6")
	document.getElementById("timetable").innerHTML="<table border='2' align='center'><tr align=center><td></td><td>8.30-10.25</td><td>10.30-12.30</td><td>1.15-3.15</td><td>3.15-5.15</td></tr>   <tr align=center><td>MON</td><td colspan=2>PPL LAB</td><td>AOA</td><td>PPL</td></tr>  <tr align=center><td>TUE</td><td>TOC</td><td>COA</td><td colspan=2>BREADTH</td></tr>   <tr align=center><td>WED</td><td>COA </td><td>AOA</td><td>PPL</td><td>TOC</td></tr>  <tr align=center><td>THU</td><td>PPL</td><td>AOA</td><td colspan=2>COA LAB</td></tr>    <tr align=center><td>FRI</td><td>COA</td><td>TOC</td><td colspan=2>BREADTH</td></tr></table>";
	else if(document.getElementById("class").value=="Sigma-7")
	document.getElementById("timetable").innerHTML="<table border='2' align='center'><tr align=center><td></td><td>8.30-10.25</td><td>10.30-12.30</td><td>1.15-3.15</td><td>3.15-5.15</td></tr>   <tr align=center><td>MON</td><td colspan=2>COA LAB</td><td>TOC</td><td>AOA</td></tr>  <tr align=center><td>TUE</td><td colspan=2>PPL LAB</td><td colspan=2>BREADTH</td></tr>   <tr align=center><td>WED</td><td>PPL </td><td>TOC</td><td>COA</td><td>AOA</td></tr>  <tr align=center><td>THU</td><td>COA</td><td>TOC</td><td>AOA</td><td>PPL</td></tr>    <tr align=center><td>FRI</td><td>COA</td><td>PPL</td><td colspan=2>BREADTH</td></tr></table>";
	else if(document.getElementById("class").value=="Sigma-8")
	document.getElementById("timetable").innerHTML="<table border='2' align='center'><tr align=center><td></td><td>8.30-10.25</td><td>10.30-12.30</td><td>1.15-3.15</td><td>3.15-5.15</td></tr>   <tr align=center><td>MON</td><td colspan=2>COA LAB</td><td>PPL</td><td>COA</td></tr>  <tr align=center><td>TUE</td><td>TOC</td><td>AOA</td><td colspan=2>BREADTH</td></tr>   <tr align=center><td>WED</td><td>COA </td><td>AOA</td><td>PPL</td><td>TOC</td></tr>  <tr align=center><td>THU</td><td>COA</td><td>PPL</td><td colspan=2>PPL LAB</td></tr>    <tr align=center><td>FRI</td><td>AOA</td><td>TOC</td><td colspan=2>BREADTH</td></tr></table>";
	else if(document.getElementById("class").value=="Sigma-9")
	document.getElementById("timetable").innerHTML="<table border='2' align='center'><tr align=center><td></td><td>8.30-10.25</td><td>10.30-12.30</td><td>1.15-3.15</td><td>3.15-5.15</td></tr>   <tr align=center><td>MON</td><td>AOA</td><td>PPL</td><td>TOC</td><td>COA</td></tr>  <tr align=center><td>TUE</td><td colspan=2>PPL LAB</td><td colspan=2>BREADTH</td></tr>   <tr align=center><td>WED</td><td>COA </td><td>TOC</td><td>AOA</td><td>PPL</td></tr>  <tr align=center><td>THU</td><td>AOA</td><td>TOC</td><td colspan=2>COA LAB</td></tr>    <tr align=center><td>FRI</td><td>PPL</td><td>COA</td><td colspan=2>BREADTH</td></tr></table>";
	else
	document.getElementById("timetable").innerHTML="<font color=red><blink><center>** TIME TABLE IS NOT AVAILABLE **</center></blink></font>";	
	}
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
		if(uname=="") document.getElementById("info").innerHTML="<center><font color='red'>Please Enter Username</font></center>";
		else document.getElementById("info").innerHTML="<center><font color='red'>Please Enter Password</font></center>";
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
        
            <a class="mainmenu" onfocus="if(this.blur)this.blur()" onmouseover="showMenu('institute');" id="main_institute" href="index.jsp">Home</a>
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
                <li><a onfocus="if(this.blur)this.blur()" id="sub" href="index.jsp?page=StaffAchievements">Staff</a></li>
              </ul>
              </div>

<div id="sub_menu_campuslife">
				
              </div>
            </div>

		<script type="text/javascript" src="js/Registration.js" ></script></script>
		<link rel="stylesheet" type="text/css" media="all" href="css/jsDatePick_ltr.min.css" />
		<script>g_l=[];g_l.MONTHS=["Janaury","February","March","April","May","June","July","August","September","October","November","December"];g_l.DAYS_3=["Sun","Mon","Tue","Wed","Thu","Fri","Sat"];g_l.MONTH_FWD="Move a month forward";g_l.MONTH_BCK="Move a month backward";g_l.YEAR_FWD="Move a year forward";g_l.YEAR_BCK="Move a year backward";g_l.CLOSE="Close the calendar";g_l.ERROR_2=g_l.ERROR_1="Date object invalid!";g_l.ERROR_4=g_l.ERROR_3="Target invalid";g_jsDatePickImagePath="img/";g_jsDatePickDirectionality="ltr";g_arrayOfUsedJsDatePickCalsGlobalNumbers=[];g_arrayOfUsedJsDatePickCals=[];g_currentDateObject={};g_currentDateObject.dateObject=new Date();g_currentDateObject.day=1;g_currentDateObject.month=3;g_currentDateObject.year=1994;</script>
		<script type="text/javascript" src="js/jsDatePick.min.1.3.js"></script>
<script type="text/javascript">
	window.onload = function(){
		new JsDatePick({
			useMode:2,
			target:"dob",
			dateFormat:"%d-%m-%Y"
		});
	};	
</script>
<div id="content" style='background:url(imgs/q9.jpg)'>
		
		<center><font size=6>Student Registration</font>
		<br />
		<span id="p"></span>
		<br/></center>
		<table style="margin-left:300px;">
		<tbody><tr><td width=150>ID Number : </td><td width=100><input required name="idn" id="stu_id" type="text" value="<%=id%>" readonly='true'></td><td width=150 id="id_error"></td></tr>
		<tr><td>Name : </td><td><input required name="user" onblur=validate_name(this.id,"name_error")  id="stu_name" type="text" onKeyPress="return validateKeyName(event)"></td><td id="name_error"></td></tr>
		<tr><td>Password  :</td><td><input required name="pswd" id="stu_pass" type="password"  onblur=validate_pass_f(this.id,"stu_passc","pass_error1","pass_error")></td><td id="pass_error1"></td></tr>
		<tr><td>Confirm Password  :</td><td><input required name="pswd" id="stu_passc" type="password" onblur=check("stu_pass",this.id,"pass_error")></td><td id="pass_error"></td></tr>
		<tr><td>Course:</td><td><select name="course" id="stu_course">
		<option value="E2">E-II</option>
		<option value="E3">E-III</option>
		<option value="E4">E-IV</option>
	</select></td></tr>



<tr><td>Branch    : </td><td>
<input type="text" value="CSE" id="branch" readonly="true" />
</td></tr>
<tr><td>Class     :</td><td>
	<select name="clss" id="clss" onchange='validateClass()'>
		<option value='None' selected="selected">Select class</option>
		<%
		for(int i=1;i<=12;i++){%>
			<option value='Sigma<%=i%>'>Sigma-<%=i%></option>);
			<%}%>
		<option value='Sigma14'>Sigma-14</option>
	</select></td><td id="clssError"></td></tr>
<tr><td>Date of Birth :</td><td>
<input type="text" size="12" readonly="true" id="dob" onblur="validateDob()"/>
</td><td id="dob_error"></td></tr>
<tr><td>Address :</td><td><textarea style='resize:none;' required name="add" id="stu_add" ></textarea></td></tr>
<tr><td>Mail id :</td><td> <input required name="mail" type="text" id="stu_mail" onblur=validate_email(this.id,"mail_error")></td><td><div id="mail_error"></div></td></tr>
<tr><td>Phone No :</td><td><input required name="phone" type="text" id="stu_phn" MAXLENGTH=13 onblur=validate_phnum(this.id,"phnum_error") onKeyPress="return validateKeyPhn(event)" > </td><td id="phnum_error"></td></tr>
<tr><form id="photo_form" method="POST" enctype="multipart/form-data" action="savePhotoStu.jsp"><td>Upload Photo</td><td><input type="file" id="file0" name="file0"></td><td><div id="photo_error"></div></td></form></tr>
<tr><td></td><td><input type="button" value="Submit" onclick=registration(1)></td></tr>
</tbody></table>
		</div>
<%}
else{
	String site = new String("index.jsp");
	response.setStatus(response.SC_MOVED_TEMPORARILY);
	response.setHeader("Location", site);
	
	}%>
