<%@page import="java.sql.*, java.util.Date,java.util.*,java.util.Calendar,java.text.*, java.util.TreeMap"%>
<%
		Connection con = null;
		Class.forName("com.mysql.jdbc.Driver");
		con= DriverManager.getConnection("jdbc:mysql://localhost/cse?user=root&password=cse");
		PreparedStatement ps = null;
		String sql;
		String s=request.getParameter("accs_lvl");
		int Acess_Level=Integer.parseInt(s);
		int nss;
		String id=request.getParameter("id");
		String name=request.getParameter("name");
		String cls=request.getParameter("cls");
		String course=request.getParameter("course");
		String dob=request.getParameter("dob");
		String add=request.getParameter("add");
		String mail=request.getParameter("mail");
		String phn=request.getParameter("phn");
                int result1=0;
		if (Acess_Level==1)//student
		{
			
			if(request.getParameter("nss")!=null) nss=1;
			else nss=0;
			sql="INSERT INTO student VALUES(?,?,?,?,?,?,?,?,?)";
			ps=con.prepareStatement(sql);
			ps.setString(1,id);
			ps.setString(2,name);
			ps.setString(3,cls);
			ps.setString(4,course);
			ps.setString(5,dob);						
			ps.setString(6,add);
			ps.setString(7,"");			
			ps.setString(8,mail);
			ps.setString(9,phn);
			result1=ps.executeUpdate();
		}
		
		
		sql="INSERT INTO accounts VALUES (?,?,?,?)";
		ps=con.prepareStatement(sql);
		ps.setString(1,id);
		ps.setString(2,name);
		ps.setString(3,request.getParameter("pass"));
		ps.setInt(4,Acess_Level);
		int result2=ps.executeUpdate();
		if((result1==1)&&(result2==1))
			out.println(1);
		else
			out.println(0);
		%>
