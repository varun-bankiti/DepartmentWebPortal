<%@ page import="java.sql.*"%>
<%
	Connection con = null;
	Class.forName("com.mysql.jdbc.Driver");
	con= DriverManager.getConnection("jdbc:mysql://localhost/cse?user=root&password=cse");
	PreparedStatement ps = null;
	String qry;
	String from=(String) session.getAttribute("user");//######################
	String course=(String) session.getAttribute("course");//######################
	String question=request.getParameter("question");//######################
	question=question.replace("%2B","+");
	int f=question.indexOf("<script>");
	int l=question.indexOf("</script>");
	if(f>=0 && l>=0){
		l=l+9;
		String tmp="";
		for(int i=0;i<question.length();i++){
			if(i<f || i>l)
				tmp+=question.charAt(i);
			}
		question=tmp;
		}
	String to=request.getParameter("to");
	qry="select * from questions";
	ps=con.prepareStatement(qry);
	ResultSet result=ps.executeQuery();
	int count=0;
	while(result.next())count++;
	String id="ques-"+(count+1);//######################
	
	try{qry="insert into questions values(?,?,?,?,CURRENT_TIMESTAMP)";
	ps=con.prepareStatement(qry);
	ps.setString(1,id);
	ps.setString(2,question);
	ps.setString(3,course);
	ps.setString(4,from);
	int result1=ps.executeUpdate();
	qry="select * from faculty where subject LIKE '%"+course+"%'";
	ps=con.prepareStatement(qry);
	result=ps.executeQuery();
	result.next();
	String notice_to_fac=result.getString(1);//######################
	
	qry="select * from notices";
	ps=con.prepareStatement(qry);
	result=ps.executeQuery();
	count=0;
	while(result.next())count++;
	String notice_id="notice-"+(count+1);//######################
	qry="insert into notices values(?,?,?,CURRENT_TIMESTAMP,?)";
	ps=con.prepareStatement(qry);
	ps.setString(1,notice_id);
	ps.setString(2,notice_to_fac);
	ps.setString(3,"Discussion_Board");
	ps.setString(4,"A Question Has Been Posted To Discussion Board by "+from+". Kindly Go to <a href='course.jsp?course="+course+"&page=Discussion#"+id+"_table'>Discussion Board</a> And answer");
	int result2=ps.executeUpdate();
	if((result1==1)&&(result2==1))
		out.println(1);
	else
		out.println(0);
	}
	catch(Exception e){out.println(e);}
	%>
