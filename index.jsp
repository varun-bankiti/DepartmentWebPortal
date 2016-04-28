<%-- 
    Document   : index
    Created on : 20 Aug, 2013, 10:49:42 PM
    Author     : Varun
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
    <head>
    <title>CS-RKV</title>
    <style>
	#time-table{font-family:"Lucida Sans Unicode", "Lucida Grande", Sans-Serif;font-size:12px;width:480px;text-align:left;border-collapse:collapse;margin:20px;}#time-table th{border:1px solid white;font-size:13px;font-weight:normal;background:#b9c9fe;border-top:2px solid #aabcfe;border-bottom:1px solid #fff;color:#039;padding:8px;}#time-table td{text-align:center;border:1px solid white;background:#e8edff;border-bottom:1px solid #fff;color:#669;border-top:1px solid transparent;padding:8px;}#time-table tr:hover td{background:#d0dafd;color:#339;}
	</style>

        <link rel="stylesheet" href="css/style_900.css" media="screen,print">
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/cycle-plugin.js"></script>
<script>
function get_timetable()
{
	if(document.getElementById("class").value=="Sigma-14")
	document.getElementById("timetable").innerHTML="<center><table id='time-table' summary='Sigma-14 Time Table'><th scope='col'><b>CSE-4A<b></th><th>8.30-10.25</th><th>10.30-12.30</th><th>1.15-3.15</th><th>3.15-5.15</th></tr><tr><th>MONDAY</th><td>Project</td><td>Bredth</td><td>NS_B1</td><td>DM_B1</td></tr><tr><th>TUESDAY</th><td>Project</td><td>DM_B1</td><td >CN</td><TD>AI</TD></tr> <tr><th>WEDNESDAY</th><td>BREDTH</td><td>CN</td><td>PROJECT</td><td>NS_B1</td></tr> <tr><th>THURSDAY</th><td>AI</td><td>Project</td><TD>NS_B1</TD><td>DM_B1</td></tr><tr><th>FRIDAY</th><td>Bredth</td><td>CN</td><td  colspan=2>CN LAB</td></tr><TR><TH>SATURDAY</TH><TD>AI</TD><TD></TD><TD></TD><TD></TD></TR></table></center>";
	else if(document.getElementById("class").value=="Sigma-1")
	document.getElementById("timetable").innerHTML="<center><table id='time-table' summary='Sigma-1 Time Table'><th scope='col'><b>CSE-4B<b></th><th>8.30-10.25</th><th>10.30-12.30</th><th>1.15-3.15</th><th>3.15-5.15</th></tr><tr><th>MONDAY</th><td>CN</td><td>Bredth</td><td>NS_B1</td><td>DM_B1</td></tr><tr><th>TUESDAY</th><td>NS_B2</td><td>DM_B1</td><td >PROJECT</td><TD>AI</TD></tr> <tr><th>WEDNESDAY</th><td>BREDTH</td><td>NS_B2</td><td>CN</td><td>NS_B1</td></tr> <tr><th>THURSDAY</th><td>AI</td><td>CN</td><TD>NS_B1</TD><td>DM_B1</td></tr><tr><th>FRIDAY</th><td>Bredth</td><td colspan=2>CN LAB</td><td>NS_B2</td></tr><TR><TH>SATURDAY</TH><TD>AI</TD><TD></TD><TD></TD><TD></TD></TR></table></center>";
	else if(document.getElementById("class").value=="Sigma-2")
	document.getElementById("timetable").innerHTML="<center><table id='time-table' summary='Sigma-2 Time Table'><th scope='col'><b>CSE-4C<b></th><th>8.30-10.25</th><th>10.30-12.30</th><th>1.15-3.15</th><th>3.15-5.15</th></tr><tr><th>MONDAY</th><td>DM_B2</td><td>Bredth</td><td>CN</td><td>DM_B1</td></tr><tr><th>TUESDAY</th><td>NS_B2</td><td>DM_B1</td><td >CN</td><TD>Project</TD></tr> <tr><th>WEDNESDAY</th><td>BREDTH</td><td>NS_B2</td><td>DM_B2</td><td>PROJECT</td></tr> <tr><th>THURSDAY</th><td>AI</td><td COLSPAN=2>CN LAB</td><td>DM_B1</td></tr><tr><th>FRIDAY</th><td>Bredth</td><td>CN</td><td>DM_B2</td><TD>NS_B2</TD></tr><TR><TH>SATURDAY</TH><TD>AI</TD><TD></TD><TD></TD><TD></TD></TR></table></center>";
	else if(document.getElementById("class").value=="Sigma-3")
	document.getElementById("timetable").innerHTML="<center><table id='time-table' summary='Sigma-3 Time Table'><th scope='col'><b>CSE-4D<b></th><th>8.30-10.25</th><th>10.30-12.30</th><th>1.15-3.15</th><th>3.15-5.15</th></tr><tr><th>MONDAY</th><td>DM_B2</td><td>Bredth</td><td COLSPAN=2>CN LAB</td></tr><tr><th>TUESDAY</th><td>NS_B2</td><td>CN</td><td >NS_B3</td><TD>AI</TD></tr> <tr><th>WEDNESDAY</th><td>BREDTH</td><td>NS_B2</td><td>DM_B2</td><td>CN</td></tr> <tr><th>THURSDAY</th><td>AI</td><td>NS_B3</td><TD>PROJECT</TD><td>CN</td></tr><tr><th>FRIDAY</th><td>Bredth</td><td>NS_B3</td><td>DM_B2</td><TD>NS_B2</TD></tr><TR><TH>SATURDAY</TH><TD>AI</TD><TD></TD><TD></TD><TD></TD></TR></table></center>";
	else if(document.getElementById("class").value=="Sigma-4")
	document.getElementById("timetable").innerHTML="<center><table id='time-table' summary='Sigma-4 Time Table'><th scope='col'><b>CSE-4E<b></th><th>8.30-10.25</th><th>10.30-12.30</th><th>1.15-3.15</th><th>3.15-5.15</th></tr><tr><th>MONDAY</th><td>DM_B2</td><td>Bredth</td><td>PROJECT</td><td>CN</td></tr><tr><th>TUESDAY</th><td COLSPAN=2>CN LAB</td><td >NS_B3</td><TD>AI</TD></tr> <tr><th>WEDNESDAY</th><td>BREDTH</td><td>CN</td><td>DM_B2</td><td>PROJECT</td></tr> <tr><th>THURSDAY</th><td>AI</td><td>NS_B3</td><TD>CN</TD><td>PROJECT</td></tr><tr><th>FRIDAY</th><td>Bredth</td><td>NS_B3</td><td>DM_B2</td><TD>PROJECT</TD></tr><TR><TH>SATURDAY</TH><TD>AI</TD><TD></TD><TD></TD><TD></TD></TR></table></center>";
	
	else if(document.getElementById("class").value=="Sigma-5")
	document.getElementById("timetable").innerHTML="<center><table id='time-table' summary='Sigma-5 Time Table'><th scope='col'><b>CSE-3A<b></th><th>8.30-10.25</th><th>10.30-12.30</th><th>1.15-3.15</th><th>3.15-5.15</th></tr><tr><th>MONDAY</th><td  colspan=2>COA LAB</td><td>PPL</td><td>COA</td></tr><tr><th>TUESDAY</th><td>AOA</td><td>TOC</td><td  colspan=2>BREADTH</td></tr> <tr><th>WEDNESDAY</th><td>PPL </td><td>COA</td><td>TOC</td><td>AOA</td></tr> <tr><th>THURSDAY</th><td>COA</td><td>TOC</td><td  colspan=2>PPL LAB</td></tr><tr><th>FRIDAY</th><td>PPL</td><td>AOA</td><td  colspan=2>BREADTH</td></tr></table></center>";
	else if(document.getElementById("class").value=="Sigma-6")
	document.getElementById("timetable").innerHTML="<CENTER><table id='time-table' summary='Sigma-6 Time Table'><th scope='col'><b>CSE-3B<b></th><th>8.30-10.25</th><th>10.30-12.30</th><th>1.15-3.15</th><th>3.15-5.15</th></tr><tr ><th>MONDAY</th><td colspan=2>PPL LAB</td><td>AOA</td><td>PPL</td></tr>  <tr ><tH>TUESDAY</tH><td>TOC</td><td>COA</td><td colspan=2>BREADTH</td></tr>   <tr ><th>WEDNESDAY</th><td>COA </td><td>AOA</td><td>PPL</td><td>TOC</td></tr>  <tr ><th>THURSDAY</th><td>PPL</td><td>AOA</td><td colspan=2>COA LAB</td></tr>    <tr ><th>FRIDAY</th><td>COA</td><td>TOC</td><td colspan=2>BREADTH</td></tr></table></center>";
	else if(document.getElementById("class").value=="Sigma-7")
	document.getElementById("timetable").innerHTML="<CENTER><table id='time-table' summary='Sigma-7 Time Table' ><th scope='col'><b>CSE-3C<b></th><th>8.30-10.25</th><th>10.30-12.30</th><th>1.15-3.15</th><th>3.15-5.15</th></tr><tr ><th>MONDAY</th><td colspan=2>COA LAB</td><td>TOC</td><td>AOA</td></tr>  <tr ><th>TUESDAY</th><td colspan=2>PPL LAB</td><td colspan=2>BREADTH</td></tr>   <tr ><th>WEDNESDAY</th><td>PPL </td><td>TOC</td><td>COA</td><td>AOA</td></tr>  <tr ><tH>THURSDAY</tH><td>COA</td><td>TOC</td><td>AOA</td><td>PPL</td></tr>    <tr ><tH>FRIDAY</tH><td>COA</td><td>PPL</td><td colspan=2>BREADTH</td></tr></table></center>";
	else if(document.getElementById("class").value=="Sigma-8")
	document.getElementById("timetable").innerHTML="<center><table id='time-table' summary='Sigma-8 Time Table' ><th scope='col'><b>CSE-3D<b></th><th>8.30-10.25</th><th>10.30-12.30</th><th>1.15-3.15</th><th>3.15-5.15</th></tr><tr ><th>MONDAY</th><td colspan=2>COA LAB</td><td>PPL</td><td>COA</td></tr>  <tr ><th>TUESDAY</th><td>TOC</td><td>AOA</td><td colspan=2>BREADTH</td></tr>   <tr ><th>WEDNESDAY</th><td>COA </td><td>AOA</td><td>PPL</td><td>TOC</td></tr>  <tr ><th>THURSDAY</th><td>COA</td><td>PPL</td><td colspan=2>PPL LAB</td></tr>    <tr ><th>FRIDAY</th><td>AOA</td><td>TOC</td><td colspan=2>BREADTH</td></tr></table></center>";
	else if(document.getElementById("class").value=="Sigma-9")
	document.getElementById("timetable").innerHTML="<center><table id='time-table' summary='Sigma-9 Time Table' ><th scope='col'><b>CSE-3E<b></th><th>8.30-10.25</th><th>10.30-12.30</th><th>1.15-3.15</th><th>3.15-5.15</th></tr> <tr ><th>MONDAY</th><td>AOA</td><td>PPL</td><td>TOC</td><td>COA</td></tr>  <tr ><th>TUESDAY</th><td colspan=2>PPL LAB</td><td colspan=2>BREADTH</td></tr>   <tr ><th>WEDNESDAY</th><td>COA </td><td>TOC</td><td>AOA</td><td>PPL</td></tr>  <tr ><th>THURSDAY</th><td>AOA</td><td>TOC</td><td colspan=2>COA LAB</td></tr>    <tr ><th>FRIDAY</th><td>PPL</td><td>COA</td><td colspan=2>BREADTH</td></tr></table></center>";
	else if(document.getElementById("class").value=="Sigma-10")
	document.getElementById("timetable").innerHTML="<center><table id='time-table' summary='Sigma-10 Time Table' ><th scope='col'><b>CSE-2A<b></th><th>8.30-10.25</th><th>10.30-12.30</th><th>1.15-3.15</th><th>3.15-5.15</th></tr> <tr ><th>MONDAY</th><td colspan=2>DOA LAB</td><td>NT</td><td>HSS</td></tr>  <tr ><th>TUESDAY</th><td>BE</td><td>DS</td><td>DOA</td><td>NT</td></tr>   <tr ><th>WEDNESDAY</th><td>DS</td><td>DOA</td><td colspan=2>NT LAB</td></tr>  <tr ><th>THURSDAY</th><td>DOA</td><td>BE</td><td>NT</td><td>DS</td></tr>    <tr ><th>FRIDAY</th><td>BE</td><td>HSS</td><td colspan=2>BE LAB</td></tr><TR><TH>SATURDAY</TH><TD>HSS</TD><TD></TD><TD></TD><TD></TD></TR></table></center>";
	else if(document.getElementById("class").value=="Sigma-11")
	document.getElementById("timetable").innerHTML="<center><table id='time-table' summary='Sigma-10 Time Table' ><th scope='col'><b>CSE-2B<b></th><th>8.30-10.25</th><th>10.30-12.30</th><th>1.15-3.15</th><th>3.15-5.15</th></tr> <tr ><th>MONDAY</th><td colspan=2>DOA LAB</td><td>BE</td><td>DS</td></tr>  <tr ><th>TUESDAY</th><td>DOA</td><td>NT</td><td>DS</td><td>BE</td></tr>   <tr ><th>WEDNESDAY</th><td>DOA</td><td>NT</td><td colspan=2>BE LAB</td></tr>  <tr ><th>THURSDAY</th><td>DS</td><td>HSS</td><td>DOA</td><td>NT</td></tr>    <tr ><th>FRIDAY</th><td>BE</td><td>HSS</td><td colspan=2>NT LAB</td></tr><TR><TH>SATURDAY</TH><TD></TD><TD>HSS</TD><TD></TD><TD></TD></TR></table></center>";
	else if(document.getElementById("class").value=="Sigma-12")
	document.getElementById("timetable").innerHTML="<center><table id='time-table' summary='Sigma-10 Time Table' ><th scope='col'><b>CSE-2C<b></th><th>8.30-10.25</th><th>10.30-12.30</th><th>1.15-3.15</th><th>3.15-5.15</th></tr> <tr ><th>MONDAY</th><td colspan=2>DOA LAB</td><td>DS</td><td>DOA</td></tr>  <tr ><th>TUESDAY</th><td>DS</td><td>BE</td><td colspan=2>BE LAB</td></tr>   <tr ><th>WEDNESDAY</th><td>BE</td><td>HSS</td><td>DOA</td><td>NT</td></tr>  <tr ><th>THURSDAY</th><td>NT</td><td>DOA</td><td COLSPAN=2>NT LAB</td></tr>    <tr ><th>FRIDAY</th><td>NT</td><td>BE</td><td>DS</td><td>HSS</td></tr></table></center>";
	else
	document.getElementById("timetable").innerHTML="<font color=red><blink><center>** TIME TABLE IS NOT AVAILABLE **</center></blink></font>";	
	}

</script>

<script type="text/javascript">
	$(document).ready(function(){
	
	$('#fade').cycle();
	});
function validateKeyId(e)
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
	else if (("abcdefghijklmnopqrstuvwxyz0123456789").indexOf(keychar) > -1) return true;
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
<jsp:include page="top.jsp" />
<div id="content">
<% String pagea=request.getParameter("page");
if(pagea==null){
String user=(String)session.getAttribute("user");
if(user!=null){
		String site = new String("/Portal/welcome.jsp");
		response.setStatus(response.SC_MOVED_TEMPORARILY);
		response.setHeader("Location", site);
	}
else{
		%>
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
		
	<div id="log" style="background-color:#FCFCFC;">
	<div id="home_notice">
				<h3 align="center" style="line-height:10px;color:blue;font-family:'Lucida Console', Monaco, monospace;text-shadow:0 0 3px pink;font-size:16px;"><br><br>Recent Updates</h3> 
				<h2 align=center><blink>Technical Test-2 key is updated</blink></h2>
				<tr><td><p id="notice_content"><marquee scrolldelay=250 direction="up" onmouseover="this.stop()" onmouseout="this.start()">
				
				</marquee>
			
			</div>
	<style type="text/css">.log_heading{width:auto;white-space:nowrap;font-family:Geneva,Arial,Helvetica,sans-serif,monospace;font-size:1.13em;color:#7b9bbd;padding:0 3px 0 15px;text-align:left;}.log_heading h1{font-family:Geneva,Arial,Helvetica,sans-serif,monospace;font-size:1.13em;color:#7b9bbd;padding:0PX; margin:0px;}.reg_under{font-family:Arial;font-size:0.75em;color:#666;font-weight:bold;list-style:none;white-space:nowrap;text-align:left;}.reg_enter{background-color:#0052ad;border:1px solid #999999;color:#FFFFFF;padding:7px 15px 7px 15px;font-family:Arial, Helvetica, sans-serif;font-size:0.7em;font-weight:bold;}.reg_enter a{padding:2px;}.reg_enter a:visited{color:#FFFFFF;}.main_tdiv_temp{width:1002px; margin:auto;}.main_tdiv_tempIF{width:100%; margin:auto;}.main_tdiv_tempLeft{width:700px; float:left;}.main_tdiv_tempRight{width:300px; float:right;}.login_logHead{font-family:Arial, Helvetica, sans-serif;font-size:1em; color:#7193B8;text-align:left;line-height:25px;border-bottom:3px solid #7193B8; font-weight:bold;}.login_logHead a{color:#7193B8;text-decoration:none;}.log_Right{width:250px;height:392px; background-color:#FFF; float:right; box-shadow:0px 0px 3px #888;}.log_ad_back{ margin-top:10px; width:230px; background-color:#fff; padding:5px; margin-bottom:10px;}.lost_pass_outter{background-color:#333333; padding:1em; width:22em; margin:auto; position:absolute; left:8em; top:0em;} form{margin:0em;padding:0em;}.lost_pass_under{background-color:#ffffff; width:22em;}.lost_pass_head{background-color:#f2f2f2; text-align:left; border-bottom:0.0625em solid #e1e1e1; line-height:2em; padding-left:0.625em; font-family:Arial, Helvetica, sans-serif; font-size:0.8em; color:#333333; font-weight:bold; }.lost_pass_text{line-height:2em; padding-left:0.625em; font-family:Arial, Helvetica, sans-serif; font-size:0.8em; color:#333333;}.lost_pass_submit{padding-right:0.625em;} .form{margin:0px; padding:0px;}.loaginW_back{background-color:#FFFFFF; padding:10px 0px;}.loaginW_text{font-family:Arial, Helvetica, sans-serif; font-size:0.8em; color:#666666; line-height:30px; padding-left:15px; padding-right:15px; float:left;}.loaginW_icons1{float:left; margin-right:10px; background:url(/india/images/login_icons.gif) no-repeat 0 -43px; width: 83px; height: 33px;}.loaginW_icons2{float:left; margin-right:10px; background:url(/india/images/login_icons.gif) no-repeat 0 -129px; width: 111px; height: 33px;}.loaginW_icons3{float:left; margin-right:10px; background:url(/india/images/login_icons.gif) no-repeat 0 -86px; width: 111px; height: 33px;}.loaginW_icons4{float:left; background:url(/india/images/login_icons.gif) no-repeat 0 0; width:111px; height:33px;}.loaginW_icons5{float:left; background:url(/india/images/login_icons.gif) no-repeat 0 -172px; width:111px; height:33px;}.loaginW{ float:left; padding-right:10px; width:33px; height:33px;}.LeftMain{width:250px; float:left;}.RightMain{width:742px; float:left;}.RightLeft{width:421px; float:left; padding:0px 30px;}.errorMsg{background:#FFC url(/india/images/fail.gif) no-repeat 10px 8px;font-family:Arial,Helvetica,sans-serif;font-size:.7em;color:#333;padding:5px 35px;line-height:20px; text-align:left; clear:both; border:1px solid #f8ea85;}.errorMsg a{color:#333;text-decoration:underline}.errorMsg a:hover{text-decoration:none}.errorMsg a:visited{color:#333}.reg_under1{font-family:Arial, Helvetica, sans-serif; font-size:0.8em; color:#666;text-align:left;line-height:20px;}.reg_under1 a{color:#666;text-decoration:underline;}.reg_under1 a:visited{color:#666;}.reg_under1 a:hover{text-decoration:none;}.login_table{width:380px;font-family: Arial, Helvetica, sans-serif;font-size: .8em;color: #333;font-weight:bold;text-align:left;}.login_table input{width:350px;height:30px;border:#cococo;color:#000;font-size:13px;}.submit_login_button{background-color: #0052ad;color: #FFFFFF;border:none;font-family: Arial, Helvetica, sans-serif;font-size: 0.7em;font-weight: bold;width:80px;height:30px;text-align:left;}.center_login_form{width:400px; margin-left:510px;margin-top:-300px;height:300px;background-color:#FFF; box-shadow:0px 0px 10px #888;-moz-box-shadow:0px 0px 10px #888;}.login_form{width:380px;margin:0 auto;}.h1{font-family: Arial, Helvetica, sans-serif;font-size: 1em;color: #0050af;text-align: left;padding: 0;line-height: 30px;font-weight: bold;margin:0;}</style>
	<div class="center_login_form">
            <div class="login_form" style="position:relative; margin-left:20px;">
            	<div style="height:10px;"></div>
                <table width="388">
                    <tbody>
                    <tr>
                        <td align="left"><span class="h1">Login here</span></td>
                        <td align="right"><a href="Registration.jsp" style="color:#0050af; text-decoration:none; font-family:Arial, Helvetica, sans-serif; font-size:13px;margin-right:10px;">New user? Register Here</a></td>
                    </tr>
                </tbody></table>
                <form name="loginForm" method="post" action="check.jsp">
                    <input name="destroy_session" id="destroy_session" type="hidden">
                    <table class="login_table">
                    <tr><td><div id="info"><br></div></td></tr>
                        <tbody><tr>
                            <td><label for="UserName">Username</label></td>
                        </tr>
                        <tr>
                            <td><input  required name="uname" id="uname" type="text" placeholder="Username" onKeyPress="return validateKeyId(event)"></td>
                        </tr>
                        <tr>
                            <td height="10"></td>
                        </tr>
                        <tr>
                            <td><label for="Password">Password</label></td>
                        </tr>
                        <tr>
                            <td><input required name="pwd" id="pwd" type="password" placeholder="Password"></td>
                        </tr>
                        <tr>
                            <td height="10"></td>
                        </tr>
                    </tbody></table>
                    <table align="left">
                        <tbody><tr>
                            <td align="left"><input style="font-size:13px;" name="Submit" value="Sign In" class="reg_enter" style="cursor:pointer; text-align:center;" type="submit"></td><td align=right width=500 class="reg_under1" colspan="2"><a href="ForgotPassword.jsp" style="color:#0050af; text-decoration:none; font-family:Arial, Helvetica, sans-serif; font-size:13px;">Forgot password?</a></td>
                            <!--<td class="reg_under" style="text-align:left; font-family:Arial, Helvetica, sans-serif; font-size:13px; color:#666666; font-weight:bold;" align="left"><input name="remember" id="remember" value="remember_me" type="checkbox">
                                <label for="remember">Stay signed in</label> </td>-->
                        </tr>
                        </tbody></table>
                        <tr>
                            <td colspan="2" height="10"></td>
                        </tr>
                        <tr>
                            
                        </tr>
                        <tr>
                            <td colspan="2" height="30"></td>
                        </tr>
                    </tbody></table>
				</div>
	
				</div>
			<br /><br />
            </div>
<% }}
else if(pagea.equals("AcademicCalendar")){%><jsp:include page="AcademicCalendar.jsp" /><%}
else if(pagea.equals("Curriculum")){%><jsp:include page="Curriculum.jsp" /><%}
else if(pagea.equals("AboutCSE")){%><jsp:include page="AboutCSE.jsp" /><%}
else if(pagea.equals("Timetable")){%><jsp:include page="Timetable.jsp" /><%}
else if(pagea.equals("FacultyDetails")){%><jsp:include page="FacultyDetails.jsp" /><%}
else if(pagea.equals("FacultyAchievements")){%><jsp:include page="FacultyAchievements.jsp" /><%}
else if(pagea.equals("StudentAchievements")){%><jsp:include page="StudentAchievements.jsp" /><%}
else if(pagea.equals("StaffAchievements")){%><jsp:include page="StaffAchievements.jsp" /><%}
else if(pagea.equals("ContactUs")){%><jsp:include page="ContactUs.jsp" /><%}
else if(pagea.equals("PhotoGallery")){%><jsp:include page="PhotoGallery.jsp" /><%}%>
</div>
</div>
</div><CENTER><div id="footer" style="height:30px;width:1000px;color:white;text-shadow:2px 2px 5px red;font-size:18px;">Copyright &copy <a href="http://cse.rkv.rgukt.in" style="text-decoration:none;color:white;">CS-RKV</a> 2013</div></CENTER>
</body>
</html>

