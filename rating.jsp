<html>
	<head>
		<script type="text/javascript">
			function selstar(o,val)
			{
			for(var x=1;x<=val;x++)
				document[o+x].src="star2.gif";
			}
			function remstar(o,val)
			{
			for(var x=1;x<=val;x++)
				document[o+x].src="star1.gif";
			}
      function setrate(val,ansr_id)
		{
			alert("function called");
			save_rating=new XMLHttpRequest();
			save_rating.onreadystatechange=function()
			{
				if (save_rating.readyState==4 && save_rating.status==200){
					selstar('i',save_rating.responseText);
					}
			}
			url="save_rating.jsp?value="+val+"&ansr_id="+ansr_id;
			save_rating.open("GET",url,true);
			save_rating.send();
			}
			</script>
		</head>
	<body>
		<div id="rating">
		<%@page import="java.sql.*, java.util.Date,java.util.*,java.util.Calendar,java.text.*, java.util.TreeMap"%>
		<%
		Connection con = null;
		Class.forName("com.mysql.jdbc.Driver");
		con= DriverManager.getConnection("jdbc:mysql://localhost/cse?user=root&password=cse");
		PreparedStatement ps = null;
		String qry;
		String user=(String) session.getAttribute("user");
		qry="select * from answers where ansr_id=?";
		ps=con.prepareStatement(qry);
		ps.setString(1,"ans11");
		ResultSet result= ps.executeQuery();
		result.next();
		float old_rating=result.getFloat(6);
		int rating=(int) old_rating;
		int i;
		for(i=1;i<=rating;i++){
			out.println("<img name=i"+i+" class=star onclick=setrate("+i+",'ans11') src='star2.gif'>");
			}
		for(int j=i;j<=5;j++){
			out.println("<img name=i"+j+" class=star onclick=setrate("+j+",'ans11') src='star1.gif'>");
			}
		%>
		<img name=j1 class=star onmouseover=selstar('j',1) onmouseout=remstar('j',1) onclick=setrate(1,'ans11') src="star1.gif">
        <img name=j2 class=star onmouseover=selstar('j',2) onmouseout=remstar('j',2) onclick=setrate(2,'ans11') src="star1.gif">
        <img name=j3 class=star onmouseover=selstar('j',3) onmouseout=remstar('j',3) onclick=setrate(3,'ans11') src="star1.gif">
        <img name=j4 class=star onmouseover=selstar('j',4) onmouseout=remstar('j',4) onclick=setrate(4,'ans11') src="star1.gif">
        <img name=j5 class=star onmouseover=selstar('j',5) onmouseout=remstar('j',5) onclick=setrate(5,'ans11') src="star1.gif">
        </div>
	</body>
</html>
