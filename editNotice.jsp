<%-- 
    Document   : editNotice
    Created on : 19 Sep, 2013, 8:20:41 AM
    Author     : Varun
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
int accessLvl=(Integer)session.getAttribute("access_lvl");
if(accessLvl==3){
    try{
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
        <h1 align=center>Edit Notice</h1>
    <script type="text/javascript">
            function opt(){
                    if((document.getElementById('notice_to').value=="ids")){
                            document.getElementById("classes").style.display="none";
                            document.getElementById("place").style.display="block";
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
            function submit(id)
            {
                    var fina=1,ids=1;
                    if((document.getElementById("notice").value=="")||(document.getElementById("notice").value==null))
                            {document.getElementById("display").innerHTML="<font color='red'>Notice cannot be Empty</font>";
                            fina=0;}
                    else{
                            var continu2=0;
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
                    if(fina==1 &ids==1){
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
                                                            alert("Notice Saved Successfully");
                                                            window.location.href="faculty.jsp?from=7";
                                                            }
                                            }
                            }
                            url="postNotice.jsp?notice="+notice+"&to="+to+"&new=no&id="+id;
                            postNotice.open("GET",url,true);
                            postNotice.send();	

                            }
            }
            </script>
            </head>
            <body>
            <%
            Connection con = null;
            Class.forName("com.mysql.jdbc.Driver");
            con= DriverManager.getConnection("jdbc:mysql://localhost/cse?user=root&password=cse");
            PreparedStatement ps = null;
            String qry;
            String id=request.getParameter("id");
            
            qry="select * from notices where notice_id=?";
            ps=con.prepareStatement(qry);
            ps.setString(1,id);
            ResultSet re=ps.executeQuery();
            re.next();
            String notice=re.getString(5);
            String to=re.getString(2);
            %>
            <textarea rows="8" cols="80" name="notice" id="notice" placeholder=""><%=notice%></textarea><div id='display'><br></div>
            <select name="to"  id="notice_to" onchange="opt()">
            <%if(to.equals("all")) out.println("<option value='all' selected='selected'>To All</option>");
            else out.println("<option value='all' >To All</option>");
            if(to.charAt(0)=='R' && to.charAt(1)=='0') out.println("<option value='ids' selected='selected'>To Any ID(s) </option>");
            else out.println("<option value='ids' >To Any ID(s) </option>");
            if(to.equals("all_students")) out.println("<option value='all_students' selected='selected'>All Students</option>");
            else out.println("<option value='all_students'>All Students</option>");
            if(to.equals("all_faculty")) out.println("<option value='all_faculty' selected='selected'>All Faculty</option>");
            else out.println("<option value='all_faculty'>All Faculty</option>");
            try{if(to.substring(0,3).equals("Sig")) out.println("<option value='classes' selected='seleccted'>Class Wise</option>");
            else out.println("<option value='classes'>Class Wise</option>");}
            catch(Exception e){}
            out.println("</select>");
            
            out.println("<a  href='javascript:void(0)' onclick= submit('"+id+"')><img src='imgs/pn2.jpg'></a>");
            %>
           
           <%if(to.charAt(0)=='R' && to.charAt(1)=='0'){ out.println("<div id='place'>");%>
           Write Id Numbers and separate with (- 'hifen' )<br><input type='text' name='nam' id='to_ids' value=<%=to%>></div><br>
           <%}
           else{ out.println("<div id='place' style='display:none;'>");
           %>
           Write Id Numbers and separate with (- 'hifen' )<br><input type='text' name='nam' id='to_ids' ></div><br>
                 <%}
                 if(to.substring(0,3).equals("Sig")) out.println("<div id='classes'>");
                 else out.println("<div id='classes' style='display:none;'>");
                 %>
            <table>
            <tr><td colspan=5 align="center"><h3>E4 Classes</h3></td></tr>
            <tr><td><input type='checkbox' name='Sigma1' id='Sigma1'<% if(to.contains("Sigma1")) out.println("checked='checked'");%>>:Sigma-1</td><td><input type='checkbox' name='Sigma2' id='Sigma2' <% if(to.contains("Sigma2")) out.println("checked='checked'");%>>Sigma-2</td><td><input type='checkbox' name='Sigma3' id='Sigma3' <% if(to.contains("Sigma3")) out.println("checked='checked'");%>>Sigma-3</td><td><input type='checkbox' name='Sigma4' id='Sigma4' <% if(to.contains("Sigma4")) out.println("checked='checked'");%>>Sigma-4</td><td><input type='checkbox' name='Sigma14' id='Sigma14' <% if(to.contains("Sigma14")) out.println("checked='checked'");%>>Sigma-14</td></tr>
            <tr><td colspan=5 align="center"><h3>E3 Classes</h3></td></tr>
            <tr><td><input type='checkbox' name='Sigma5' id='Sigma5' <% if(to.contains("Sigma5")) out.println("checked='checked'");%>>:Sigma-5</td><td><input type='checkbox' name='Sigma6' id='Sigma6' <% if(to.contains("Sigma6")) out.println("checked='checked'");%>>Sigma-6</td><td><input type='checkbox' name='Sigma7' id='Sigma7' <% if(to.contains("Sigma7")) out.println("checked='checked'");%>>Sigma-7</td><td><input type='checkbox' name='Sigma8' id='Sigma8' <% if(to.contains("Sigma8")) out.println("checked='checked'");%>>Sigma-8</td><td><input type='checkbox' name='Sigma9' id='Sigma9' <% if(to.contains("Sigma9")) out.println("checked='checked'");%>>Sigma-9</td></tr>
            <tr><td colspan=5 align="center"><h3>E2 Classes</h3></td></tr>
            <tr><td><input type='checkbox' name='Sigma10' id='Sigma10' <% if(to.contains("Sigma10")) out.println("checked='checked'");%>>:Sigma-10</td><td><input type='checkbox' name='Sigma11' id='Sigma11' <% if(to.contains("Sigma11")) out.println("checked='checked'");%>>Sigma-11</td><td><input type='checkbox' name='Sigma12' id='Sigma12' <% if(to.contains("Sigma12")) out.println("checked='checked'");%>>Sigma-12</td></tr>
            </table>
            </div>
            <br>
    			</div>
		</div>
<%}
    catch(Exception e){out.println(e);}
}
else{
String site = new String("index.jsp");
response.setStatus(response.SC_MOVED_TEMPORARILY);
response.setHeader("Location", site);   
}
%>
