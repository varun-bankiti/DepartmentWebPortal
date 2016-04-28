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
function validateId(e)
{
	var key;
	var keychar;
	if (window.event)
	key = window.event.keyCode;
	else if (e)
	key = e.which;
	else
	return true;
	keychar = String.fromCharCode(key);
	keychar = keychar.toLowerCase();
	// control keys
	if ((key==null) || (key==0) || (key==8) || 
	(key==9) || (key==13) || (key==27) )
	return true;
	// alphas and numbers
	else if (((key==114)||(key==82))&&(document.getElementById("in").value.length)==0) return true;
	else if ((("0123456789").indexOf(keychar) > -1)&&(document.getElementById("in").value.length)!=0) return true;
	else
	return false;
}
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
                <li><a onfocus="if(this.blur)this.blur()" id="sub" href="index.jsp?page=Curriculum">Curriculum</a></li>
                <li><a onfocus="if(this.blur)this.blur()" id="sub" href="index.jsp?page=AboutCSE">About CSE</a></li>
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
			<div id="fade" style="float-left;">
      <img src="imgs/1.jpg" width="900" height="190">

      <img src="imgs/2.jpg" width="900" height="190">
      <img src="imgs/3.jpg" width="900" height="190">
      <img src="imgs/4.jpg" width="900" height="190">
      <img src="imgs/5.jpg" width="900" height="190">
      <img src="imgs/6.jpg" width="900" height="190">
      <img src="imgs/7.jpg" width="900" height="190">
      <img src="imgs/8.jpg" width="900" height="190">
      <img src="imgs/9.jpg" width="900" height="190">

    </div>

</head>
<div id="content">
<% String pagea=request.getParameter("page");
if(pagea==null){%>
<center><table style="background:lightgrey;margin-top:100px;" width="300px" height="200px"
		<tr>
			<td colspan=3><center><font size=4.5><b>Login For Register</b></font></center></td>
		</tr>
		<tr>
		<td height=40><font size=4>Username</font></td><td>:</td><td><input type="text" id="username" name="username" MAXLENGTH=7 placeholder="ID" onKeyPress="return validateId(event)"></td>
		</tr>
		<tr>
			<td height=40><font size=4>Password</font></td><td>:</td><td><input type="password" id="pwd" name="pwd" placeholder="Exam-Password" MAXLENGTH=5></td>
		</tr>
		<tr>
			<td colspan=3 align="center" height=40><input style="width:80px;height:30px;background:purple;color:white;font-size:18px;" type="Button" onclick=regLogin() value="Login!"></td>
		</tr>
	</table><div id="valid" style="width:300px;"></div></font></center>
	
	<br><br><br>
	<center>
	<h2 >Instructions</h2>
	<h3>Students</h3></center>
	<ul style="margin-left:200px;">
		<li style="padding:5px;">
			1.Register Using Your University ID & Exam Password
		</li>
		<li style="padding:5px;">
			2.All Details must be Correct
		</li>
		<li style="padding:5px;">
			3.Phone Number should be your personal number. Upload your Original Photo
		</li>
		
	</ul>
	<center><h3>Faculty</h3></center>
	<ul style="margin-left:200px;">
		<li style="padding:5px;">
			1.Register Using Defauls ID Password Provided for you
		</li>
		<li style="padding:5px;">
			2.Change Your Username While Registering
		</li>
		<li style="padding:5px;">
			3.After Registration Kindly wiat for account verification
		</li>
		
	</ul>
	
            </div>
<% }
else if(pagea.equals("AcademicCalendar")){%><jsp:include page="AcademicCalendar.jsp" /><%}
else if(pagea.equals("Curriculum")){%><jsp:include page="Curriculum.jsp" /><%}
else if(pagea.equals("AboutCSE")){%><jsp:include page="AboutCSE.jsp" /><%}
else if(pagea.equals("Timetable")){%><jsp:include page="Timetable.jsp" /><%}
else if(pagea.equals("FacultyDetails")){%><jsp:include page="FacultyDetails.jsp" /><%}
else if(pagea.equals("FacultyAchievements")){%><jsp:include page="FacultyAchievements.jsp" /><%}
else if(pagea.equals("StudentAchievements")){%><jsp:include page="StudentAchievements.jsp" /><%}
else if(pagea.equals("StaffAchievements")){%><jsp:include page="StaffAchievements.jsp" /><%}
else if(pagea.equals("ContactUs")){%><jsp:include page="ContactUs.jsp" /><%}%>
</div>
	
<script type="text/javascript">
			function regLogin()
			{
				 var un=document.getElementById("username").value;
				 var pwd=document.getElementById("pwd").value;
				if(un==null || pwd==null || un=="" || pwd=="")
					{
					document.getElementById("valid").innerHTML="<center><br><font color='red'>*All fields are required</font></center>";
					return false;
					}
				else{
					uname=document.getElementById("username").value;
					pwd=document.getElementById("pwd").value;
					regLoginCheck=new XMLHttpRequest();
					regLoginCheck.onreadystatechange=function()
					{
						if (regLoginCheck.readyState==4 && regLoginCheck.status==200){
							if(regLoginCheck.responseText==1){window.location.href="stuReg.jsp";}
							else if(regLoginCheck.responseText==2){window.location.href="facReg.jsp";}
							else if(regLoginCheck.responseText==4){document.getElementById("valid").innerHTML="<center><br><font color='red'>*Already Completed Registration</font></center>";}
							else if(regLoginCheck.responseText==3){document.getElementById("valid").innerHTML="<center><br><font color='red'>*Invalid Username/Password</font></center>";}
							}
					}
					url="checkRegLogin.jsp?username="+uname+"&pwd="+pwd;
					regLoginCheck.open("GET",url,true);
					regLoginCheck.send();
				}
			}
			</script>
<style type="text/css">
			td
			{
				text-align:center;
				}
			</style>
</body>
</html>
