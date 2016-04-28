<%@page import="java.sql.*, java.util.Date,java.util.*,java.util.Calendar,java.text.*, java.util.TreeMap"%>
<%@page errorPage="errors.jsp" %>
<%
String user = (String)session.getAttribute("user");
if((user!=null)&&((session.getAttribute("access_lvl").toString()).equals("3"))){
%>
<%String name=(String)session.getAttribute("name");%>
<style>
#button{
	padding:2px 3px;border:1px solid white;text-decoration:none;text-align:center;font-size:18px;float:left;display:block;width:auto;height:30px;background-color:blue;color:white;font-weight:bold;border-radius:10px 10px 10px 10px;
	}

</style>
<jsp:include page="top.jsp"  />
	<div class="body">
			<div id="notices_menu">
				<h2 style="text-align:center;margin-top:10px;">Notices<hr></h2>
				<ul>
					<li><a href="faculty.jsp?from=4">Coordinator</a></li>
					<li><a href="faculty.jsp?from=3">Faculty</a></li>
					<li><a href="faculty.jsp?from=5">Discussion</a></li>
					<li><a href="faculty.jsp?from=6">Post Notice</a></li>
                                        <li><a href="faculty.jsp?from=7">My Notices</a></li>
				</ul>
			</div>
			<div id="notices">
			<%
					Connection con = null;
					Class.forName("com.mysql.jdbc.Driver");
					con= DriverManager.getConnection("jdbc:mysql://localhost/cse?user=root&password=cse");
					PreparedStatement ps = null;
					String qry;
					String tem=request.getParameter("from");
					int from;
					if(tem==null)
							from=0;
						else
							from=Integer.parseInt(tem);
					if(from<6){
						qry="select * from notices order by time desc";
						ps=con.prepareStatement(qry);
						ResultSet notices = ps.executeQuery();
					
						int noticeCount=0;
						%><table id='notice_disp' style='font-size:13px;font-family:"Comic Sans MS", cursive, sans-serif' ><tr height=40 style='font-size:15px;font-weight:bold;background:url(imgs/q9.jpg);'><td width=150 align='center'>From:</td><td width=700 align='center'>Notice</td><td width=100>Posted On</td></tr>
						<%if(noticeCount==0) out.println("<tr height=60px style='background:url(imgs/b6.jpg);border-radius:10px;><td colspan=3>No Notices Found</td></tr>");
						while(notices.next()){
							if ((notices.getString(2).contains(user))||(notices.getString(2).equals("all"))||(notices.getString(2).equals("all_faculty"))){
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
									out.println("<tr  style='background:url(imgs/b6.jpg);border-radius:10px;'><td  valign='top'  align='left' width=100>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src='"+photo+"' width=50 height=50><br><b>"+fromname.getString(2)+"</b></td><td width=600 style='line-height:20px;text-indent:50px;padding:10px;' valign='top'>"+notices.getString(5)+"</td><td valign='bottom'>"+noticeDate+"</td>");
									
								}
							
								else if((from==0)||(from==fromname.getInt(4))){
									noticeCount++;
									out.println("<tr  style='background:url(imgs/b6.jpg);border-radius:10px;'><td  valign='top'  align='left' width=100>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src='"+photo+"' width=50 height=50><br><b>"+fromname.getString(2)+"</b></td><td width=600 style='line-height:20px;text-indent:50px;padding:10px;' valign='top'>"+notices.getString(5)+"</td><td valign='bottom'>"+noticeDate+"</td>");
								}
									
							}
						}
						if(noticeCount==0) out.println("<tr height=60px style='color:blue;font-size:15px;font-weight:bold;background:url(imgs/b6.jpg);border-radius:10px;><td colspan=3 align=center>No Notices Found</td></tr>");
						out.println("</table>");
					}
                                        else if(from==6){%>
						<h1 align=center>Post Notice</h1>
						<script type="text/javascript">

							count=1;
							function opt(){
								if((document.getElementById('notice_to').value=="ids")){
									document.getElementById("classes").style.display="none";
									document.getElementById("place").style.display="block";
									count=0;
									}
								else if((document.getElementById('notice_to').value=="classes")){
									document.getElementById("classes").style.display="block";
									document.getElementById("place").style.display="none";
									}
								else {
									document.getElementById('place').style.display="none";
									document.getElementById('classes').style.display="none";
									}
							}
							function submit()
							{
								var fina=1;
								if((document.getElementById("notice").value=="")||(document.getElementById("notice").value==null))
									{document.getElementById("display").innerHTML="<font color='red'>Notice cannot be Empty</font>";
									fina=0;}
								else{
									var continu2=0,ids=1;
									if((document.getElementById('notice_to').value=="ids")){
										if((document.getElementById("to_ids").value=="")||(document.getElementById("to_ids").value==null)){
											document.getElementById("display").innerHTML="<font color='red'>Write At Lease One ID</font>";
                                                                                        ids=0;
											}
										}
									
									else if((document.getElementById('notice_to').value=="classes")){
										for(i=1;i<=12;i++){
											if(document.getElementById("Sigma"+i).checked){
												continu2=1;
												break;
												}
											}
										if(document.getElementById("Sigma14").checked) continu2=1;
										if(continu2==0){
											document.getElementById("display").innerHTML="<font color='red'>Select Atleast One Class</font>";
											fina=0;
											}
										}
											
									}
								if(fina==1 && ids==1){
									notice=document.getElementById("notice").value;
									to="";
									if(document.getElementById("notice_to").value=="ids") to=document.getElementById("to_ids").value;
									else if(document.getElementById("notice_to").value=="classes"){
										for(i=1;i<=12;i++){
											if(document.getElementById("Sigma"+i).checked) to=to+"Sigma"+i+"@";
											}
										if(document.getElementById("Sigma14").checked) to=to+"Sigma14@";
										}
									else to=document.getElementById("notice_to").value;
									postNotice=new XMLHttpRequest();
									postNotice.onreadystatechange=function()
									{
										if (postNotice.readyState==4 && postNotice.status==200){
												if(postNotice.responseText==1){
													alert("Notice Posted Successfully");
													window.location.href="faculty.jsp?from=7";
													}
											}
									}
									url="postNotice.jsp?notice="+notice+"&to="+to+"&new=yes";
									postNotice.open("GET",url,true);
									postNotice.send();	
																
									}
							}

							</script>
							</head>
							<body>
							
							<textarea rows="8" cols="80" name="notice" id="notice" placeholder="Write Notice Here..."></textarea><div id='display'><br></div>
							<select name="to"  id="notice_to" onchange="opt()">
							<option value="all">To All</option>
							<option value="ids">To Any ID(s) </option>
							<option value="all_students">All Students</option>
							<option value="all_faculty">All Faculty</option>
							<option value="classes">Class Wise</option>
							</select>
							<a  href='javascript:void(0)' onclick=submit()><img src='imgs/pn2.jpg'></a>
							<div id="place" style="display:none;">Write Id Numbers and separate with (- 'hifen' )<br><input type='text' name='nam' id='to_ids'></div><br>
							<div id="classes" style="display:none;">
							<table>
							<tr><td colspan=5 align="center"><h3>E4 Classes</h3></td></tr>
							<tr><td><input type='checkbox' name='Sigma1' id='Sigma1'>:Sigma-1</td><td><input type='checkbox' name='Sigma2' id='Sigma2'>Sigma-2</td><td><input type='checkbox' name='Sigma3' id='Sigma3'>Sigma-3</td><td><input type='checkbox' name='Sigma4' id='Sigma4'>Sigma-4</td><td><input type='checkbox' name='Sigma14' id='Sigma14'>Sigma-14</td></tr>
							<tr><td colspan=5 align="center"><h3>E3 Classes</h3></td></tr>
							<tr><td><input type='checkbox' name='Sigma5' id='Sigma5'>:Sigma-5</td><td><input type='checkbox' name='Sigma6' id='Sigma6'>Sigma-6</td><td><input type='checkbox' name='Sigma7' id='Sigma7'>Sigma-7</td><td><input type='checkbox' name='Sigma8' id='Sigma8'>Sigma-8</td><td><input type='checkbox' name='Sigma9' id='Sigma9'>Sigma-9</td></tr>
							<tr><td colspan=5 align="center"><h3>E2 Classes</h3></td></tr>
							<tr><td><input type='checkbox' name='Sigma10' id='Sigma10'>:Sigma-10</td><td><input type='checkbox' name='Sigma11' id='Sigma11'>Sigma-11</td><td><input type='checkbox' name='Sigma12' id='Sigma12'>Sigma-12</td></tr>
							</table>
							</div><br>
						<%}
                                        else{%>
                                            <script>
                                                function deleteNotice(id){
                                                    deleteNoticeReq=new XMLHttpRequest();
                                                    deleteNoticeReq.onreadystatechange=function()
                                                    {
                                                            if (deleteNoticeReq.readyState==4 && deleteNoticeReq.status==200){
                                                                            if(deleteNoticeReq.responseText==1){
                                                                                    alert("Notice Deleted Successfully");
                                                                                    window.location.href="faculty.jsp?from=7";
                                                                                    }
                                                                    }
                                                    }
                                                    url="deleteNotice.jsp?id="+id;
                                                    deleteNoticeReq.open("GET",url,true);
                                                    deleteNoticeReq.send();	
									
                                                }
                                            </script>
                                            
                                            <%
                                               qry="select * from notices where `from`=? and `to`!='None' order by time desc";
                                            ps=con.prepareStatement(qry);
                                            ps.setString(1,user);
                                            ResultSet re=ps.executeQuery();%>
                                            <table id='notice_disp' style='font-size:13px;font-family:"Comic Sans MS", cursive, sans-serif' ><tr height=40 style='font-size:15px;font-weight:bold;background:url(imgs/q9.jpg);'><td width=100 align='center'>Notice To</td><td width=600 align='center'>Notice</td><td width=100>Posted On</td><td width=60>Edit</td><td width=60>Delete</td></tr>
                                            <%
                                            int noticeCount=0;
                                            while(re.next()){
                                                noticeCount++;
                                                String noticeDate1 = re.getString("time").substring(0,10);
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
                                                        noticeDate = "Today "+re.getString("time").substring(11,16);
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

                                                out.println("<tr style='background:url(imgs/b6.jpg);border-radius:10px;'><td  valign='top'  align='left' width=100><b>");
                                                String to=re.getString("to");
                                                
                                                String tos[]=to.split("@");
                                                for(int i=0;i<tos.length;i++)
                                                      out.println(tos[i].toUpperCase()+"<br>");
                                                out.println("</b></td><td width=600 style='line-height:20px;text-indent:50px;padding:10px;' valign='top'>"+re.getString("notice")+"</td><td valign='bottom'>"+noticeDate+"</td><td><a href='editNotice.jsp?id="+re.getString("notice_id")+"'>Edit</a></td><td><a href='javascript:void(0)' onclick=deleteNotice('"+re.getString("notice_id")+"')>Delete</a></td></tr>");
                                                }
                                             
                                                if(noticeCount==0) 
                                                    out.println("<tr style='background:url(imgs/b6.jpg);border-radius:10px;'><td  valign='middle'  align='center' height=60 width=100 colspan=5><b>No Notices Found</b></td></tr>");
                                            }
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
