<%@page import="java.sql.*, java.util.Date,java.util.*,java.util.Calendar,java.text.*, java.util.TreeMap"%>
<%@page contentType="text/html; charset=UTF-8" %>
<%
try{
		request.setCharacterEncoding("UTF-8");
		Connection con = null;
		Class.forName("com.mysql.jdbc.Driver");
		con= DriverManager.getConnection("jdbc:mysql://localhost/cse?user=root&password=cse");
		PreparedStatement ps = null;
		String qry;
		String user=(String) session.getAttribute("user");
		String ques_id=request.getParameter("ques_id");
		String answer=request.getParameter("answer");
		answer=answer.replace("%2B","+");
		int f=answer.indexOf("<script>");
		int l=answer.indexOf("</script>");
		if(f>=0){
			l=l+9;
			String tmp="";
			for(int i=0;i<answer.length();i++){
				if(i<f || i>l)
					tmp+=answer.charAt(i);
				}
			answer=tmp;
			}
		qry="select * from answers where ques_id=?";
		ps=con.prepareStatement(qry);
		ps.setString(1,ques_id);
		ResultSet result=ps.executeQuery();
		int i=0;
		while(result.next()) 
			i++;
		int start=4;
		int end=ques_id.length();
		char c[]=new char[end-start];
		ques_id.getChars(start,end,c,0);
		String x=new String(c);
		String ansId="ans"+x+(i+1);
		qry="insert into answers(ansr_id,ques_id,posted_by,answer,rated_by) values(?,?,?,?,?)";
		ps=con.prepareStatement(qry);
		ps.setString(1,ansId);
		ps.setString(2,ques_id);
		ps.setString(3,user);
		ps.setString(4,answer);
		ps.setString(5,"");
		String photo="Photos/"+user;
		int rating=0;
		int j;
		j=ps.executeUpdate();
		qry="select * from notices";
		ps=con.prepareStatement(qry);
		result=ps.executeQuery();
		int count=0;
		while(result.next())count++;
		String notice_id="notice-"+(count+1);//######################
		qry="select * from questions where ques_id=?";
		ps=con.prepareStatement(qry);
		ps.setString(1,ques_id);
		result=ps.executeQuery();
		result.next();
		String notice_to=result.getString(4);//######################
		String course=(String) session.getAttribute("course");//######################
		qry="insert into notices values(?,?,?,CURRENT_TIMESTAMP,?)";
		ps=con.prepareStatement(qry);
		ps.setString(1,notice_id);
		ps.setString(2,notice_to);
		ps.setString(3,"Discussion_Board");
		ps.setString(4,"An Answer has been posted for your question by "+user+". Go to<a href='course.jsp?course="+course+"&page=Discussion'>Discussion Board</a> and check it");
		int k=ps.executeUpdate();
		if((j==1)&&(k==1)){
			out.println("<table style='background:url(imgs/b6.jpg);' FRAME=VOID CELLSPACING=0 COLS=3 RULES=NONE BORDER=0><COLGROUP><COL WIDTH=100><COL WIDTH=500><COL WIDTH=100><col width=150></COLGROUP>");
			out.println("<TR style='background:url(imgs/b6.jpg);'><TD height=60 id='top-left'><img src='"+photo+"' width=50 height=50></TD><TD id='top'>"+answer+"</TD><TD id='top'>");
				for(int kk=1;kk<=5;kk++)
					out.println("<img name=j"+ansId+kk+" class=star onmouseover=selstar('j"+ansId+"',"+kk+") onmouseout=remstar('j"+ansId+"',"+kk+") onclick=setrate("+kk+",'"+ansId+"') src='star1.gif'>");
				out.println("</td><td id='top-right'></td></tr>");
				out.println("<TR ><TD valign='bottom-left'>"+user+"</TD><TD id='bottom' align='right'>Few Seconds Ago</TD><TD id='bottom'>");
				int ii;
				for(ii=1;ii<=rating;ii++){ 
						out.println("<img name=i"+ansId+ii+" class=star src='star2.gif'>");
					}
				for(int jj=ii;jj<=5;jj++){
					out.println("<img name=i"+ansId+jj+" class=star src='star1.gif'>");
					}
				out.println("</td><td id='bottom-right' ></td></tr></table>\n");
								
			
		}
		else
			out.println(0);
}
catch(Exception e){out.println(e);}
%>
