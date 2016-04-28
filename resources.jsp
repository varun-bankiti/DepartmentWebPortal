<%@page import="java.sql.*, java.util.Date,java.util.*,java.util.Calendar,java.text.*, java.util.TreeMap"%>
<%String filePath = "/Portal/Resources/";
String user=(String)session.getAttribute("user");
String course=(String)session.getAttribute("course");
if(user!=null){
%>
<script>
var count=1;
var no_of_files=1;
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
function submitResource(){
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
		SubmitResourceText=new XMLHttpRequest();
		SubmitResourceText.onreadystatechange=function()
		{
			if (SubmitResourceText.readyState==4 && SubmitResourceText.status==200){
					if(SubmitResourceText.responseText==1)
					document.getElementById("form").submit();
				}
		}
		url="SaveResourceText.jsp?matter="+matter+"&fileName="+fileName;
		SubmitResourceText.open("GET",url,true);
		SubmitResourceText.send();
	}
}

function toggle(id){
	if (id=="post"){
		document.getElementById("post").style.display="block";
		document.getElementById("view").style.display="none";
		document.getElementById("first").style.background="blue";
		document.getElementById("second").style.background="none";

	}
	else{
		document.getElementById("view").style.display="block";
		document.getElementById("post").style.display="none";
		document.getElementById("second").style.background="blue";
		document.getElementById("first").style.background="none";
		}
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
	qry="select * from resources where course=? order by time desc";
	ps=con.prepareStatement(qry);
	ps.setString(1,course);
	ResultSet result=ps.executeQuery();
	int count=0;
String s =session.getAttribute("access_lvl").toString();
int access_lvl=Integer.parseInt(s);
if(access_lvl==3){%>
	<div id="options"><a id="first" href="javascript:void(0)" onclick=toggle("post") style="background-color:blue;margin-left:200px;" ><img src='imgs/PR.jpg'></a><a  id="second" href="javascript:void(0)" onclick=toggle("view") style="margin-left:20px;"><img src='imgs/VR.jpg'></a></div>
	<br><br><hr>
	<div id='post'><br><br>
	<center><textArea name="matter" rows=4 cols=60 id="matter" style="resize:none;" placeholder="Enter Description About Resource"></textArea></center>
	<form id="form" action="SaveResource.jsp" method="POST" enctype="multipart/form-data">
	<br>
	
	<br>
	<center><input type="file" name="file0" id="fileid0" size=100>
	<br>
	
	<div id="upload_fields">
	</div>
	</form>
	<br>
	<center>
	<a href="javascript:void(0)" onclick=submitResource()  style="margin-left:0px;"><img src='imgs/posta.jpg'></a><a style="margin-left:20px;" href="javascript:void(0)" onclick="add_field()"><img src='imgs/AMF.jpg'></a>
	</center>
	</div>
	<div id="view" style="display:none;">
	<br>
	<%
	out.println("<center><table border=1>");
	out.println("<tr height=40 style='background:url(imgs/q8.jpg);'><td align='center' width=150>From</td><td align='center' width=500>Description</td><td align='center' width=200>Attachments</td><td align='center' width=100>Time</td></tr>");
	while(result.next()){
		
			count++;
			qry="select * from accounts where id=?";
			ps=con.prepareStatement(qry);
			ps.setString(1,result.getString(4));
			ResultSet fromname=ps.executeQuery();
			fromname.next();
			String photo="";
			String name="";
			if(fromname.getInt(4)==3){
				qry="select * from faculty where fac_id=?";
				ps=con.prepareStatement(qry);
				ps.setString(1,result.getString(4));
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
			
			out.println("<tr style='background:url(imgs/b6.jpg);'><td valign='top'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src='"+photo+"' width=50 height=50><br>"+name+"</td><td valign='top'>"+result.getString(6)+"</td><td valign='top'>");
			String array[]=(result.getString(3)).split("-_-");
			try{for(int index=0;index<array.length;index++){
				out.println("<a href='"+filePath+array[index]+"' target='blank'>"+array[index]+"</a><br>");
				}
			}
			catch(Exception e){out.println(e);}
				String resource1 = result.getString(5).substring(0,10);
				DateFormat qdf1 = new SimpleDateFormat("yyyy-MM-dd");
				Date  date1 = qdf1.parse(resource1);
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
				String resourceDate=null;
				if(count2==1)
					resourceDate = "Today "+result.getString(5).substring(11,16);
				else if(count2==2)
					resourceDate = "1day ago";
				else if(count2>2 && count2<=18)
					resourceDate = (count2-1)+"days ago";
				else if(count2>18 && count2<=26)
					resourceDate = "3Weeks ago";
				else if(count2>26 && count2<=31)
					resourceDate = "1 Month ago";
				else if(count2>31 && count2<=62)
					resourceDate = "2 Months ago";
				else resourceDate = "few months ago";

			out.println("</td><td valign='top'>"+resourceDate+"</td></tr>");
		}
	if(count==0)out.println("<tr style='background:url(imgs/b6.jpg);'><td colspan=4 align='center' ><h3>No Resources Found</h3></td></tr>");
	out.println("</table></div>");
	}
else if(access_lvl==1){
	out.println("<center><br><table border=1>");
	out.println("<tr style='background:url(imgs/q8.jpg);' height=40><td align='center' width=150>From</td><td align='center' width=500>Description</td><td align='center' width=200>Attachments</td><td align='center' width=100>Time</td></tr>");
	while(result.next()){
			count++;
			qry="select * from accounts where id=?";
			ps=con.prepareStatement(qry);
			ps.setString(1,result.getString(4));
			ResultSet fromname=ps.executeQuery();
			fromname.next();
			String photo="";
			String name="";
			if(fromname.getInt(4)==3){
				qry="select * from faculty where fac_id=?";
				ps=con.prepareStatement(qry);
				ps.setString(1,result.getString(4));
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
			out.println("<tr style='background:url(imgs/b6.jpg);'><td valign='top'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src='"+photo+"' width=50 height=50><br>"+name+"</td><td valign='top'>"+result.getString(6)+"</td><td valign='top'>");
		
			String array[]=(result.getString(3)).split("-_-");
			try{for(int index=0;index<array.length;index++){
				out.println("<a href='"+filePath+array[index]+"' target='blank'>"+array[index]+"</a><br>");
				}
			}
			catch(Exception e){out.println(e);}
				String resource = result.getString(5).substring(0,10);
				DateFormat qdf = new SimpleDateFormat("yyyy-MM-dd");
				Date  date = qdf.parse(resource);
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
				String resourceDate1=null;
				if(count1==1)
					resourceDate1 = "Today "+result.getString(5).substring(11,16);
				else if(count1==2)
					resourceDate1 = "1day ago";
				else if(count1>2 && count1<=18)
					resourceDate1 = (count1-1)+"days ago";
				else if(count1>18 && count1<=26)
					resourceDate1 = "3Weeks ago";
				else if(count1>26 && count1<=31)
					resourceDate1 = "1 Month ago";
				else if(count1>31 && count1<=62)
					resourceDate1 = "2 Months ago";
				else resourceDate1 = "few months ago";
			out.println("</td><td valign='top'>"+resourceDate1+"</td></tr>");
		}
	if(count==0)out.println("<tr><td colspan=4 align='center' style='background:url(imgs/b6.jpg);'><h3>No Resources Found</h3></td></tr>");
	out.println("</table>");
	}
%>
<%}
else{
String site = new String("index.jsp");
response.setStatus(response.SC_MOVED_TEMPORARILY);
response.setHeader("Location", site);    
}


%>
