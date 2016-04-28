<%@page import="java.sql.*, java.util.Date,java.util.*,java.util.Calendar,java.text.*, java.util.TreeMap"%>
<%String filePath = "/Portal/Assignments/";
String course=(String)session.getAttribute("course");
String user=(String)session.getAttribute("user");
if(user!=null){
%>
<script>
var count=0;
var no_of_files=0;
function add_field(){
	a=document.createElement("br");
	div=document.getElementById("upload_fields");
	n=document.createElement("input");
	n.type="file";
	n.name="file0";
	n.id="fileid"+count;
	n.size=100;
	div.appendChild(n)
	div.appendChild(a);
	count++;
	no_of_files++;
	}
function saveAssignment(){
	var yes=0;
	for(j=0;j<no_of_files;j++){
		if((document.getElementById("fileid"+j).value!="")&&(document.getElementById("fileid"+j).value!=null)){
			yes=1;
			break;
			}
		}
	fileName=""
	for(j=0;j<no_of_files;j++){
		temp=document.getElementById("fileid"+j).value
		if((temp!="")&&(temp!=null)){
			a=temp.split("\\");
			fileName=fileName+a[a.length-1]+"-_-";
			}
		}
	matter=document.getElementById("matter").value;	
	if(((matter==null)||(matter==""))&&(yes==0)) alert("Discription or File One of Them is Required");
	else{
		assign_sub_text=new XMLHttpRequest();
		assign_sub_text.onreadystatechange=function()
		{
			if (assign_sub_text.readyState==4 && assign_sub_text.status==200){
					if(assign_sub_text.responseText==1)
						document.getElementById("form").submit();
				}
		}
		url="SaveAssignmentText.jsp?matter="+matter+"&fileName="+fileName;
		assign_sub_text.open("GET",url,true);
		assign_sub_text.send();
	}
}
function toggle(ida,idb,id1,id2){
		document.getElementById(ida).style.display="block";
		document.getElementById(idb).style.display="none";
		document.getElementById(id1).style.background="blue";
		document.getElementById(id2).style.background="none";
	}
function deleteAssignment(id){
	DeleteAssignment=new XMLHttpRequest();
	DeleteAssignment.onreadystatechange=function()
	{
		if (DeleteAssignment.readyState==4 && DeleteAssignment.status==200){
				if(DeleteAssignment.responseText==1)
					document.getElementById(id+"_row").style.display="none";
				else alert("Unable to Delete Assignment.Try Again");
			}
	}
	url="DeleteAssignment.jsp?id="+id;
	DeleteAssignment.open("GET",url,true);
	DeleteAssignment.send();
	
	}
function submitAssignment(id){
	fileName=document.getElementById("fileSub").value;
	if((fileName=="")||(fileName==null))
		alert("Select File to Submit");
	else{
		SubmitAssignment=new XMLHttpRequest();
		SubmitAssignment.onreadystatechange=function()
		{
			if (SubmitAssignment.readyState==4 && SubmitAssignment.status==200){
					if(SubmitAssignment.responseText==1) document.getElementById(id+"_form").submit();
					else alert("Unable to Submit Assignment.Try Again");
				}
		}
		url="SubmitAssignmentText.jsp?id="+id+"&fileName="+fileName;
		SubmitAssignment.open("GET",url,true);
		SubmitAssignment.send();
	}
}
function viewSubmissions(url){
	myWindow=window.open(url,"_blank","toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbar=yes, resizable=no, copyhistory=yes, width=1000 height=600");
	myWindow.focus();
	myWindow.moveTo(((screen.width/2)-500),((screen.height/2)-300));
	}
</script>
<style>
.button{
	background-color:blue;padding:2px 3px;border:1px solid white;text-decoration:none;text-align:center;font-size:18px;float:left;display:block;width:auto;height:30px;color:white;font-weight:bold;border-radius:10px 10px 10px 10px;
}
</style>
<%
	Connection con = null;
	Class.forName("com.mysql.jdbc.Driver");
	con= DriverManager.getConnection("jdbc:mysql://localhost/cse?user=root&password=cse");
	PreparedStatement ps = null;
	String qry;
	qry="select * from assignments where course=? order by time desc";
	ps=con.prepareStatement(qry);
	ps.setString(1,course);
	ResultSet result=ps.executeQuery();
	int count=0;
String s =session.getAttribute("access_lvl").toString();
int access_lvl=Integer.parseInt(s);
if(access_lvl==3){%>
	<div id="options"><a href="javascript:void(0)" onclick=toggle("post","view","first","second") id="first" style="background-color:blue;margin-left:300px;height:32px;"  ><img src='imgs/PA.jpg'></a><a href="javascript:void(0)" onclick=toggle("view","post","second","first") id="second" style="margin-left:10px;"><img src='imgs/VA.jpg'></a></div>
	<br><br><hr>
	<div id='post'><center>
	<textArea required style="resize:none;" name="matter" id="matter" rows=4 cols=60 placeholder="Enter Description About Assignment"></textArea>
	<form id="form" action="SaveAssignment.jsp" method="POST" enctype="multipart/form-data">
	<div id="upload_fields">
	</div><br><br>
	</form>
	<a href="javascript:void(0)" onclick=saveAssignment() style="margin-left:0px;"><img src='imgs/posta.jpg'></a><a style="margin-left:20px;" href="javascript:void(0)" onclick="add_field()"><img src='imgs/AMF.jpg'></a>
	</center>
	</div>
	<div id="view" style="display:none;">
	<br>
	<%
	out.println("<center><table border=1 STYLE='table-layout:fixed;'> <col width=150px/><col width=600px/><col width=200 /><col width=100 /><col width=80 />");
	out.println("<tr style='background:url(imgs/q8.jpg);'><td align='center' width=150>From</td><td width=600>Discription</td><td width=200>Attachments</td><td width=100>Submit Count</td><td width=80>Time</td><td width=50>Delete</td></tr>");
	while(result.next()){
			count++;
			qry="select * from assignment_submits where assignment_id=?";
			ps=con.prepareStatement(qry);
			ps.setString(1,result.getString(1));
			ResultSet forSubCount=ps.executeQuery();
			int submitCount=0;
			while(forSubCount.next())submitCount++;
			qry="select * from accounts where id=?";
			ps=con.prepareStatement(qry);
			ps.setString(1,result.getString(5));
			ResultSet fromname=ps.executeQuery();
			fromname.next();
			String photo="";
			String name="";
			try{if(fromname.getInt(4)==3){
				qry="select * from faculty where fac_id=?";
				ps=con.prepareStatement(qry);
				ps.setString(1,result.getString(5));
				ResultSet forPhoto=ps.executeQuery();
				forPhoto.next();
				name=forPhoto.getString(2);
				photo=forPhoto.getString(5);
				}
			else if(fromname.getInt(4)==1){
				qry="select * from student where stu_id=?";
				ps=con.prepareStatement(qry);
				ps.setString(1,result.getString(4));
				ResultSet forPhoto=ps.executeQuery();
				forPhoto.next();
				name=forPhoto.getString(2);
				photo=forPhoto.getString(5);
				}
			}
			catch(Exception e){out.println(e);}
			String discription;
			if((result.getString(2)==null)||(result.getString(2)=="")) discription="No Discription";
			else discription=result.getString(2);
			out.println("<tr style='background:url(imgs/b6.jpg);' id='"+result.getString(1)+"_row'><td valign='top'><img src='"+photo+"' width=50 height=50><br>"+name+"</td><td valign='top'>"+discription+"</td><td valign='top'>");
			String array[]=(result.getString(4)).split("-_-");
			try{for(int index=0;index<array.length;index++){
				out.println("<a href='"+filePath+array[index]+"' target='blank'>"+array[index]+"</a><br>");
				}
			}
			catch(Exception e){out.println(e);}
					String assignmentDate = result.getString(6).substring(0,10);
					DateFormat qdf = new SimpleDateFormat("yyyy-MM-dd");
					Date  date = qdf.parse(assignmentDate);
					Date curDate = new Date();
					Calendar  c = Calendar.getInstance();
					Calendar  cc = Calendar.getInstance();
					c.setTime(date);
					cc.setTime(curDate);
					int count1 = 0;
					while(c.before(cc))
						{
							count1++;
							c.add(Calendar.DATE,1);
							}
					String assignDate=null;
					if(count1==1)
						assignDate = "Today "+result.getString(6).substring(11,16);
					else if(count1==2)
						assignDate = "1day ago";
					else if(count1>2 && count1<=18)
						assignDate = (count1-1)+"days ago";
					else if(count1>18 && count1<=26)
						assignDate = "3Weeks ago";
					else if(count1>26 && count1<=31)
						assignDate = "1 Month ago";
					else if(count1>31 && count1<=62)
						assignDate = "2 Months ago";
					else assignDate = "few months ago";
			out.println("</td><td align='center'><b>"+submitCount+"<b><br><input type='button' onclick=viewSubmissions('ViewSubmissions.jsp?id="+result.getString(1)+"') value='View All'></td><td valign='top'>"+assignDate+"</td><td valign='middle'><input type='button' onclick=deleteAssignment('"+result.getString(1)+"') value='Delete'></td></tr>");
	}
	if(count==0)out.println("<tr style='background:url(imgs/b6.jpg);'><td colspan=6 align='center' ><h3>No Assignments Found</h3></td></tr>");
	out.println("</table></div>");
	}
else if(access_lvl==1){
	%>
	<div id="view">
	<center><br><table border=1 >
	<tr height=40 style='background:url(imgs/q8.jpg);'><td align='center' width=150>From</td><td width=600>Discription</td><td width=200>Attachments</td><td width=100>Time</td><td width=200>Submission</td></tr>
	<%while(result.next()){
			count++;
			qry="select * from accounts where id=?";
			ps=con.prepareStatement(qry);
			ps.setString(1,result.getString(5));
			ResultSet fromname=ps.executeQuery();
			fromname.next();
			String photo="";
			String name="";
			if(fromname.getInt(4)==3){
				qry="select * from faculty where fac_id=?";
				ps=con.prepareStatement(qry);
				ps.setString(1,result.getString(5));
				ResultSet forPhoto=ps.executeQuery();
				forPhoto.next();
				name=forPhoto.getString(2);
				photo=forPhoto.getString(5);
				}
			else if(fromname.getInt(4)==1){
				qry="select * from student where stu_id=?";
				ps=con.prepareStatement(qry);
				ps.setString(1,result.getString(4));
				ResultSet forPhoto=ps.executeQuery();
				forPhoto.next();
				name=forPhoto.getString(2);
				photo=forPhoto.getString(5);
				}	
			String discription;
			if((result.getString(2)==null)||(result.getString(2)=="")) discription="No Discription";
			else discription=result.getString(2);
			out.println("<tr style='background:url(imgs/b6.jpg);'><td valign='top'><IMG SRC='"+photo+"' width=50 height=50><br>"+name+"</td><td valign='top'>"+discription+"</td><td valign='top'>");
			String array[]=(result.getString(4)).split("-_-");
			try{for(int index=0;index<array.length;index++){
				out.println("<a href='"+filePath+array[index]+"' target='blank'>"+array[index]+"</a><br>");
				}
			}
			catch(Exception e){out.println(e);}
String assignmentDate1 = result.getString(6).substring(0,10);
					DateFormat qdf1 = new SimpleDateFormat("yyyy-MM-dd");
					Date  date1 = qdf1.parse(assignmentDate1);
					Date curDate1 = new Date();
					
					Calendar  c1 = Calendar.getInstance();
					Calendar  cc1 = Calendar.getInstance();
					c1.setTime(date1);
					cc1.setTime(curDate1);
					int count2 = 0;
					while(c1.before(cc1))
						{
							count2++;
							c1.add(Calendar.DATE,1);
							}
					String assignDate1=null;
					if(count2==1)
						assignDate1 = "Today "+result.getString(6).substring(11,16);
					else if(count2==2)
						assignDate1 = "1day ago";
					else if(count2>2 && count2<=18)
						assignDate1 = (count2-1)+"days ago";
					else if(count2>18 && count2<=26)
						assignDate1 = "3Weeks ago";
					else if(count2>26 && count2<=31)
						assignDate1 = "1 Month ago";
					else if(count2>31 && count2<=62)
						assignDate1 = "2 Months ago";
					else assignDate1 = "few months ago";			
			out.println("</td><td valign='top'>"+assignDate1+"</td>");
			qry="select * from assignment_submits where assignment_id=? and stu_id=?";
			ps=con.prepareStatement(qry);
			ps.setString(1,result.getString(1));
			ps.setString(2,user);
			ResultSet forsubmit=ps.executeQuery();
			if(forsubmit.next())out.println("<td><b>Submitted</b></td></tr>");
			else {
				if(result.getInt(7)==1) out.println("<td><form id='"+result.getString(1)+"_form' action='SubmitAssignment.jsp' method='POST' enctype='multipart/form-data'><input type='file' name='file' id='fileSub'></form><br><input type='button' value='Submit' onclick=submitAssignment('"+result.getString(1)+"')></td></tr>");
				else out.println("<td><b>Not Submitted</b></td></tr>");
			}
	}
	if(count==0)out.println("<tr style='background:url(imgs/b6.jpg);'><td colspan=5 align='center'><h3>No Assignments Found</h3></td></tr>");
	out.println("</table></div>");
	}%>
	<div id='submit' STYLE="DISPLAY:NONE;">
	<form action='SubmitAssignment.jsp' method="POST" enctype='metapart/form-data'>
	<CENTER><input required type='file' name="nam0" id="nam0"><BR><BR><BR>
	<input type="submit" value="Submit"></CENTER>
	</form>
	</div>
        <%}
else{
String site = new String("index.jsp");
response.setStatus(response.SC_MOVED_TEMPORARILY);
response.setHeader("Location", site);
    
}
        %>
