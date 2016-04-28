<%-- 
    Document   : deleteNotice
    Created on : 19 Sep, 2013, 8:20:24 AM
    Author     : Varun
--%>
<%@page import="java.sql.*, java.util.Date,java.util.*,java.util.Calendar,java.text.*, java.util.TreeMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
int accessLvl=(Integer)session.getAttribute("access_lvl");
if(accessLvl==3){
%>
        <%
        Connection con = null;
        Class.forName("com.mysql.jdbc.Driver");
        con= DriverManager.getConnection("jdbc:mysql://localhost/cse?user=root&password=cse");
        PreparedStatement ps = null;
        String qry;
        String id=request.getParameter("id");
        qry="UPDATE `notices` SET `to`=? WHERE `notice_id`=?";
        ps=con.prepareStatement(qry);
        ps.setString(1,"None");
        ps.setString(2,id);
        try{
            int result=ps.executeUpdate();
        out.println(result);
        }
        catch(Exception e){out.println(e);}
        %>
<%
}
else{
String site = new String("index.jsp");
response.setStatus(response.SC_MOVED_TEMPORARILY);
response.setHeader("Location", site);
}
%>