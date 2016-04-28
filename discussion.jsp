<%@page import="java.sql.*, java.util.Date,java.util.*,java.util.Calendar,java.text.*, java.util.TreeMap"%>
<%
String user=(String)session.getAttribute("user");
int access_lvl=(Integer)session.getAttribute("access_lvl");
%>
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
		ResultSet result;
	if(access_lvl==1){
		LinkedList<String> course_ids = new LinkedList<String>();
		LinkedList<String> courses = new LinkedList<String>();
		qry="select * from student where stu_id=?";
		ps=con.prepareStatement(qry);
		ps.setString(1,user);
		result = ps.executeQuery();
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
	 }
			 String temp=request.getParameter("subject");
			 String course=(String)session.getAttribute("course");
			int pageNum;
			if(session.getAttribute("pageno")==null){
				session.setAttribute("pageno","1");
				pageNum=1;
			}
			else{
				String x=(String)session.getAttribute("pageno");
				pageNum=Integer.parseInt(x);
			}
			int quesPage=5;
			int lower_limit=(pageNum-1)*quesPage;
			int quesCount=0;
			qry="SELECT * FROM questions where subject=?";
			ps=con.prepareStatement(qry);
			ps.setString(1,course);
			result = ps.executeQuery();
			while(result.next()) quesCount++;
			qry="SELECT * FROM questions where subject=? order by posted_on DESC limit ?,?";
			ps=con.prepareStatement(qry);
			ps.setString(1,course);
			ps.setInt(2,lower_limit);
			ps.setInt(3,quesPage);
			result = ps.executeQuery();
		%>

<script type="text/javascript" src="js/student.js"></script>
				<div id="options"><center><a href="javascript:void(0)" onclick=toggle("discussion")><img id='first' src='imgs/dis3.jpg' width=180 height=50/></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void(0)" onclick=toggle("post_ques")><img id='second' src='imgs/post1.jpg' width=180 height=50/></a></center></div>
				<div id="discussion" style="border-top:1px dotted black;">
				<%
				ResultSet result2,result2temp;
				while(result.next()){
					String questionDate = result.getString(5).substring(0,10);
					DateFormat qdf = new SimpleDateFormat("yyyy-MM-dd");
					Date  date = qdf.parse(questionDate);
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
					String question=result.getString(2);
					String quesDate=null;
					String quesId=result.getString(1);
					String quesBy=result.getString(4);
					if(count==1)
						quesDate = "Today "+result.getString(5).substring(11,16);
					else if(count==2)
						quesDate = "1day ago";
					else if(count>2 && count<=18)
						quesDate = (count-1)+"days ago";
					else if(count>18 && count<=26)
						quesDate = "3Weeks ago";
					else if(count>26 && count<=31)
						quesDate = "1 Month ago";
					else if(count>31 && count<=62)
						quesDate = "2 Months ago";
					else quesDate = "few months ago";
					out.println("<TABLE id='"+quesId.toUpperCase()+"' style='background:url(imgs/q8.jpg)' FRAME=VOID CELLSPACING=0 COLS=2 rules=none  BORDER=0><COLGROUP><COL WIDTH=100><COL WIDTH=600><COL WIDTH=150></COLGROUP><TBODY>");
					out.println("<tr x><td id='top-left' height=100 valign='top'><img src='/Portal/Photos/"+quesBy+"' width=80 height=80></td><td id='top' valign='MIDDLE'>"+question+"</td><TD id='top-right' ></TD></TR>");
					out.println("<tr><td id='bottom-left' valign='top'>"+quesBy+"</td><td id='bottom' align='right'>"+"    "+"</td><TD id='bottom-right'></TD></tr></table>");
					qry="SELECT * FROM answers where ques_id=? order by rating DESC";
					ps=con.prepareStatement(qry);
					PreparedStatement ps2=con.prepareStatement(qry);
					ps.setString(1,result.getString(1));
					ps2.setString(1,result.getString(1));
					result2temp = ps2.executeQuery();
					result2=ps.executeQuery();
					int i=0;
					int j=1;
					int k=1;
					int ansCount=0;
					while(result2temp.next()) ansCount++;
					while(result2.next()){
						String ansDate = result2.getString(4).substring(0,10);
						DateFormat qdf1 = new SimpleDateFormat("yyyy-MM-dd");
						Date  date1 = qdf1.parse(ansDate);
						Date curDate1 = new Date();
						Calendar  c1 = Calendar.getInstance();
						Calendar  cc1 = Calendar.getInstance();
						c1.setTime(date1);
						cc1.setTime(curDate1);
						int count1 = 0;
						while(c1.before(cc1))
							{
								count1++;
								c1.add(Calendar.DATE,1);
								}
						String ansId=result2.getString(1);
						String ans=result2.getString(5);
						String ansBy=result2.getString(3);
						String photo="Photos/"+ansBy;
						String ansDate1=null;
						if(count1==1)
							ansDate1 = "Today "+result2.getString(4).substring(11,16);
						else if(count1==2)
							ansDate1 = "1day ago";
						else if(count1>2 && count1<=18)
							ansDate1 = (count1-1)+"days ago";
						else if(count1>18 && count1<=26)
							ansDate1 = "3Weeks ago";
						else if(count1>26 && count1<=31)
							ansDate1 = "1 Month ago";
						else if(count1>31 && count1<=62)
							ansDate1 = "2 Months ago";
						else ansDate1 = "few months ago";
						String qryn="select * from answers where ansr_id=?";
						PreparedStatement psn=con.prepareStatement(qryn);
						psn.setString(1,result2.getString(1));
						ResultSet result3= psn.executeQuery();
						result3.next();
						String old_rated_bys=result3.getString(7);
						float old_rating=result3.getFloat(6);
						int rating=(int) old_rating;
						out.println();
						if(i<2){
								out.println("<table style='background:url(imgs/b6.jpg);' FRAME=VOID CELLSPACING=0 COLS=3 RULES=NONE BORDER=0><COLGROUP><COL WIDTH=100><COL WIDTH=500><COL WIDTH=100><col width=150></COLGROUP>");
								out.println("<TR style='background:url(imgs/b6.jpg);'><TD height=60 id='top-left'><img src='"+photo+"' width=50 height=50><br>"+ansBy+"</TD><TD id='top'>"+ans+"</TD><td id='top' align='right'>");
								if(!(old_rated_bys.contains(user))){
									out.println("<div style='text-align:right;'  id='"+ansId+"_Rate_Text'>Rate this:</div></td><TD id='top-right'>");
									for(int kk=1;kk<=5;kk++)
									out.println("<img name=j"+ansId+kk+" class=star onmouseover=selstar('j"+ansId+"',"+kk+") onmouseout=remstar('j"+ansId+"',"+kk+") onclick=setrate("+kk+",'"+ansId+"') src='star1.gif'>");
								}
								else out.println("</td><td id='top-right'>");
								out.println("</td></tr>");
								out.println("<TR ><TD valign='bottom-left'></TD><TD id='bottom' align='right'>"+"     "+"</TD><td id='bottom' align='right'>Rating:</td><TD id='bottom-right'>");
								int ii;
								for(ii=1;ii<=rating;ii++){ 
									out.println("<img name=i"+ansId+ii+" class=star src='star2.gif'>");
									}
								for(int jj=ii;jj<=5;jj++){
									out.println("<img name=i"+ansId+jj+" class=star src='star1.gif'>");
									}
								out.println("</td></tr></table>\n");
								i++;
							}
						else if(ansCount>2){
								
								if(j==1){	
									out.println("<tr><td colspan=3 align=left><div id='"+quesId+"s'><a href='javascript:void(0)'onclick=show_ansdiv('"+quesId+"')>View "+(ansCount-2)+"More Answers</a></div></td></tr></table>"); 
									out.println("<div   id='"+quesId+"' style='display:none; margin-top:-5px;'>");
									j=0;
									}
								
								out.println("<TABLE style='background:url(imgs/b6.jpg);' FRAME=VOID CELLSPACING=0 COLS=3  BORDER=0><COLGROUP><COL WIDTH=100><COL WIDTH=500><COL WIDTH=100><COL WIDTH=150></COLGROUP><TBODY>");
								out.println("<TR ><TD id='top-left' height=60><img src='"+photo+"' width=50 height=50></TD><TD id='top'>"+ans+"</TD><td id='top' align='right'>");
								if(!(old_rated_bys.contains(user))){
									out.println("<div style='text-align:right;' id='"+ansId+"_Rate_Text'>Rate this:</div></td><TD id='top-right'>");
									for(int kk=1;kk<=5;kk++)
										out.println("<img name=j"+ansId+kk+" class=star onmouseover=selstar('j"+ansId+"',"+kk+") onmouseout=remstar('j"+ansId+"',"+kk+") onclick=setrate("+kk+",'"+ansId+"') src='star1.gif'>");
								}
								else out.println("</td><td id='top-right'>");
								out.println("</td></tr>");
								out.println("<TR ><TD valign='top'>"+ansBy+"</TD><TD id='bottom' align='right'>"+"    "+"</TD><td id='bottom' align='right'>Rating:</td><TD id='bottom-right'>");
								int ii;
								for(ii=1;ii<=rating;ii++){ 
									out.println("<img name=i"+ansId+ii+" class=star src='star2.gif'>");
									}
								for(int jj=ii;jj<=5;jj++){
									out.println("<img name=i"+ansId+jj+" class=star src='star1.gif'>");
									}
								out.println("</td></tr></table>\n");
							}
							k++;					
						}
						if (j==0) {
							out.println("</table></div>\n");
							out.println("<div style='display:none;float:right;' id='"+quesId+"h'><a href='javascript:void(0)' onclick=hide_ansdiv('"+quesId+"')>Hide</a></div>");
							}
						out.println("</table>");
						out.println("<div  id='new_ans_"+quesId+"'><textArea onfocus=Maximize('"+quesId+"') onblur=Minimize('"+quesId+"') id='new_ansv_"+quesId+"' placeholder='Write Answer Here...' style='resize:none;' type='text' rows=1 cols=30></textArea><input style='display:none;' id='Post_Ans_Button_"+quesId+"' type='button' value='Post' onclick=saveAns('"+quesId+"','"+course+"')></div>");
						out.println("<br><br>");
					}
				if(pageNum>1){out.println("<center><a href='back.jsp'>Back</a>");}
				if((pageNum*quesPage)<quesCount)out.println("<a href='next.jsp'>Next</a></center>");
				if(quesCount==0){out.println("<center><h2>No Questions Found</h2></center>");}
				%>
				</div>
				<div id="post_ques" style="display:none;">
				<h1 align=center>Post Question</h1>
							<textarea rows="8" cols="80" name="question" id="question" placeholder="Write Question Here..."></textarea><div id='display'></div>
							<a href="javascript:void(0)" onclick=postQuestion()><img width=100 height=40 src='imgs/posta.jpg'></a>
							</form>
				</div>
				


