<%@ page import="java.sql.*"%>
<%
	Connection con = null;
	Class.forName("com.mysql.jdbc.Driver");
	con= DriverManager.getConnection("jdbc:mysql://localhost/cse?user=root&password=cse");
	PreparedStatement ps = null;
	String qry;
	String from=(String) session.getAttribute("user");//######################
	String notice=request.getParameter("notice");//######################
	String to=request.getParameter("to");
        String in=request.getParameter("new");
        if(in.equals("yes")){
            qry="select * from notices";
            ps=con.prepareStatement(qry);
            ResultSet result=ps.executeQuery();
            int count=0;
            while(result.next())count++;
            String id="notice-"+(count+1);//######################

            qry="insert into notices values(?,?,?,CURRENT_TIMESTAMP,?)";
            ps=con.prepareStatement(qry);
            ps.setString(1,id);
            ps.setString(2,to);
            ps.setString(3,from);
            ps.setString(4,notice);
            try{int result1=ps.executeUpdate();
            out.println(result1);
            }
            catch(Exception e){out.println(e);}
        }
        else if(in.equals("no")){
            String id=request.getParameter("id");
            qry="UPDATE `notices` SET `to`=?,`time`=CURRENT_TIMESTAMP,`notice`=? WHERE `notice_id`=?";
            ps=con.prepareStatement(qry);
            ps.setString(1,to);
            ps.setString(2,notice);
            ps.setString(3,id);
            try{int result2=ps.executeUpdate();
            out.println(result2);
            }
            catch(Exception e){out.println(e);}
        }
	%>

