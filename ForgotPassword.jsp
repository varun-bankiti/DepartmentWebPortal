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
<script>
function validateKeyPhn(e)
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
	else if ((key==43)&&(document.getElementById("stu_phn").value.length)==0) return true;
	else if ((("0123456789").indexOf(keychar) > -1)&&(document.getElementById("in").value.length)>=3) return true;
	else
	return false;
}

</script>     
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
<center>
 <form action="ResetPassword.jsp" method="POST">   
    <table style="background:lightgrey;margin-top:100px;" width="400px" height="200px"
		<tr>
			<td colspan=3><center><font size=4.5><b></b></font></center></td>
		</tr>
		<tr>
		<td height=40><font size=4>Username</font></td><td>:</td><td><input required type="text" id="username" name="username" placeholder="ID" maxlength="7"></td>
		</tr>
		<tr>
                    <td height=40><font size=4>Phone Number</font></td><td>:</td><td><input required type="text" id="phn_num" name="phn_num" placeholder="Your Phone Number" maxlength="13" onKeyPress="return validateKeyPhn(event)"></td>
		</tr>
		<tr>
			<td height=40><font size=4>Date of Birth</font></td><td>:</td><td><input required type="text" id="dob" name="dob" placeholder="Date Of Birth" readonly="true"></td>
		</tr>
<tr>
			<td height=40><font size=4>New Password</font></td><td>:</td><td><input required type="password" id="npass" name="npass" placeholder="New Password" ></td>
		</tr>

               <tr>
			<td colspan=3 align="center" height=40><input style="width:80px;height:30px;background:purple;color:white;font-size:18px;" type="Submit" value="Submit"></td>
		</tr>
	</table>
    </form>
    <div id="valid" style="width:300px;"></div></font></center>
            </div>
<style type="text/css">
			td
			{
				text-align:center;
				}
			</style>
</body>
</html>
