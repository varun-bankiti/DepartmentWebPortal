<%@page import="java.sql.*"%>
<%@page import="java.security.MessageDigest,java.security.SecureRandom"%>
<% 
		Connection con = null;
		Class.forName("com.mysql.jdbc.Driver");
		con= DriverManager.getConnection("jdbc:mysql://localhost/cse?user=root&password=cse");
		PreparedStatement ps = null;
		String qry;
		String uname=request.getParameter("uname");
		String pwd=request.getParameter("pwd");
		qry="select * from accounts where id=? and pwd=?";
		ps=con.prepareStatement(qry);
		ps.setString(1,uname);
		ps.setString(2,pwd);
		ResultSet result= ps.executeQuery();
		ResultSet result2;
		uname=uname.toUpperCase();
		if(result.next()){
			session.setAttribute("user",uname);
			session.setAttribute("access_lvl",result.getInt(4));
			if(result.getInt(4)==1){
				qry="select * from student where stu_id=?";
				ps=con.prepareStatement(qry);
				ps.setString(1,uname);
				result2=ps.executeQuery();
				result2.next();
				session.setAttribute("name",result2.getString(2));
				//Add more student session variables here
				}
			else if(result.getInt(4)==3){
				qry="select * from faculty where fac_id=?";
				ps=con.prepareStatement(qry);
				ps.setString(1,uname);
				result2=ps.executeQuery();
				result2.next();
				session.setAttribute("name",result2.getString(2));
				//Add more student session variables here
				}
			String site = new String("welcome.jsp");
			response.setStatus(response.SC_MOVED_TEMPORARILY);
			response.setHeader("Location", site);
		}
		else {
			String site = new String("index.jsp");
			response.setStatus(response.SC_MOVED_TEMPORARILY);
			response.setHeader("Location", site);
			}
		
%>
