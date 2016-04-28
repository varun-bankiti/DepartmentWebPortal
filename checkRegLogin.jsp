<%@page import="java.sql.*"%>
<%
String id=request.getParameter("username");
String pwd=request.getParameter("pwd");
Connection con = null;
Class.forName("com.mysql.jdbc.Driver");
con= DriverManager.getConnection("jdbc:mysql://localhost/cse?user=root&password=cse");
PreparedStatement ps = null;
String qry = "SELECT * FROM temp_pwd WHERE Id=? and Pwd=?";
ps = con.prepareStatement(qry);
ps.setString(1,id);
ps.setString(2,pwd);
ResultSet rs = ps.executeQuery();
int correct=0;
int access_lvl=1;
if(rs.next()){
	access_lvl=rs.getInt(3);
	correct= 1;
}
qry = "SELECT count(*) FROM accounts WHERE Id=?";
ps = con.prepareStatement(qry);
ps.setString(1,id);
rs = ps.executeQuery();
rs.next();
if(rs.getInt(1)==0){

	session.setAttribute("id",id);
	if(correct==1)
		{try{
			if(access_lvl==1){
				out.println(1);
			}
			else{
				out.println(2);
				}
			}catch(Exception e){out.println(e);}
			}
	else
	{
		out.println(3);
		}
		}
else
	{
		out.println(4);
		}
%>
