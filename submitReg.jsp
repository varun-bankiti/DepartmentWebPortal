<%@page import="java.sql.*"%>
<%@page import="java.security.MessageDigest,java.security.SecureRandom"%>
<%
String ref = request.getParameter("ref");
String id = request.getParameter("id");
session.setAttribute("id",id);
String name=request.getParameter("name");
String pass=request.getParameter("pass");

String plainText = pass;
MessageDigest mdAlgorithm = MessageDigest.getInstance("MD5");
mdAlgorithm.update(plainText.getBytes());

byte[] digest = mdAlgorithm.digest();
StringBuffer hexString = new StringBuffer();

for (int i = 0; i < digest.length; i++) {
    plainText = Integer.toHexString(0xFF & digest[i]);

    if (plainText.length() < 2) {
        plainText = "0" + plainText;
    }
    hexString.append(plainText);
}
pass=hexString.toString();
String cls=request.getParameter("cls");
String course=request.getParameter("course");
String phn=request.getParameter("phn");
String dob=request.getParameter("dob");
String mail=request.getParameter("mail");
String add=request.getParameter("add");
Connection con = null;
Class.forName("com.mysql.jdbc.Driver");
con= DriverManager.getConnection("jdbc:mysql://localhost/cse?user=root&password=cse");
PreparedStatement ps = null;
String qry = null;
int details=0;
int reff = Integer.parseInt(ref);
if(reff==1)
{
	qry="insert into student values(?,?,?,?,?,?,?,?,?,?)";
	ps=con.prepareStatement(qry);
	ps.setString(1,id);
	ps.setString(2,name);
	ps.setString(3,cls);
	ps.setString(4,"CSE");
	ps.setString(6,dob);
	ps.setString(7,add);
	ps.setString(8,"photo");
	ps.setString(9,mail);
	ps.setString(10,phn);
	ps.setString(5,course);try{
	details = ps.executeUpdate();
	qry="insert into accounts values(?,?,?,?)";
	ps = con.prepareStatement(qry);
	ps.setString(1,id);
	ps.setString(2,name);
	ps.setString(3,pass);
	ps.setInt(4,reff);
	details = details+ps.executeUpdate();
	if(details==2)
		{
		out.println(1);
		}
	}catch(Exception e){out.println(e);}
}
if(reff==3)
{
	qry="insert into faculty values(?,?,?,?,?,?,?,?)";
	ps=con.prepareStatement(qry);
	ps.setString(1,id);
	ps.setString(2,name);
	ps.setString(3,"subject");
	ps.setString(4,"CSE");
	ps.setString(5,"photo");
	ps.setString(6,mail);
	ps.setString(7,phn);
	ps.setString(8,dob);
	try{
	details = ps.executeUpdate();
	qry="insert into accounts values(?,?,?,?)";
	ps = con.prepareStatement(qry);
	ps.setString(1,id);
	ps.setString(2,name);
	ps.setString(3,pass);
	ps.setInt(4,reff);
	details = details+ps.executeUpdate();
	if(details==2)
		{
		out.println(1);
		}
	}
	catch(Exception e){out.println(e);}
}
%>
