<%@page import="java.sql.*, java.util.Date,java.util.*,java.util.Calendar,java.text.*, java.util.TreeMap"%>
<%@page errorPage="errors.jsp" %>
<%
String user = (String)session.getAttribute("user");
if(user==null)
	out.print(user.length());
else if(!(session.getAttribute("access_lvl").toString()).equals("3"))
	out.print(9/0);
%>
<style type="text/css">
#report
{
font-family:"Trebuchet MS", Arial, Helvetica, sans-serif;
width:200px;
border-collapse:collapse;
align:center;
text-align:center;
frame:box;
}

#report th 
{
font-size:1.1em;
text-align:center;
padding-top:5px;
padding-bottom:4px;
background-color:#BCD670;
color:#ffffff;
}
#report td
{
font-size:1.0em;
text-align:center;
padding-top:5px;
padding-bottom:4px;
}
</style>
<%
		Connection con = null;
		Class.forName("com.mysql.jdbc.Driver");
		con= DriverManager.getConnection("jdbc:mysql://localhost/cse?user=root&password=cse");
		PreparedStatement ps = null;
		String qry = "SELECT name,subject FROM faculty WHERE fac_id=?";
		ps = con.prepareStatement(qry);
		ps.setString(1,user);
		ResultSet rs = ps.executeQuery();
		rs.next();
		String tempSubject[]  = rs.getString(2).split(",");
		LinkedList<String> classes = new LinkedList<String>();
		for(String subject : tempSubject)
			{
				String cls = subject.split("-")[0];
				if(!classes.contains(cls))
					classes.add(cls);
				}
		Object [] classes1 = classes.toArray();
		String fromDate = request.getParameter("fromDate");
		String toDate = request.getParameter("toDate");
		LinkedList<String> dates = new LinkedList<String>();
		DateFormat df = new SimpleDateFormat("dd-MM-yyyy");
		Date  fd = df.parse(fromDate);
		Date td = df.parse(toDate);
		Calendar  c = Calendar.getInstance();
		Calendar  cc = Calendar.getInstance();
		c.setTime(fd);
		cc.setTime(td);
		while(c.before(cc))
			{
				String s;
				int temp = c.get(Calendar.MONTH);
				int temp1 = c.get(Calendar.DATE);
				if((temp<9)&&(temp1<10))
					s = "0"+c.get(Calendar.DATE)+"-0"+(c.get(Calendar.MONTH)+1)+"-"+c.get(Calendar.YEAR);
				else if((temp<9)&&(temp1>9))
					s = c.get(Calendar.DATE)+"-0"+(c.get(Calendar.MONTH)+1)+"-"+c.get(Calendar.YEAR);
				else if((temp>8)&&(temp1<10))
					s = "0"+c.get(Calendar.DATE)+"-"+(c.get(Calendar.MONTH)+1)+"-"+c.get(Calendar.YEAR);
				else 
					s = c.get(Calendar.DATE)+"-"+(c.get(Calendar.MONTH)+1)+"-"+c.get(Calendar.YEAR);
				c.add(Calendar.DATE,1);
				dates.add(s);
			}
			dates.add(toDate);
			TreeMap<String,Integer> all = new TreeMap<String,Integer>();
			int numWorkDays=0;
			int numStus=0;
			for(String d : dates)
			{
				qry = "SELECT absent FROM attendance WHERE class=? and fac_id=? and date=?";
				ps = con.prepareStatement(qry);
				ps.setString(1,request.getParameter("cls"));
				ps.setString(2,(String) session.getAttribute("user"));
				ps.setString(3,d);
				try
				{
				rs = ps.executeQuery();
				if(rs.next())
					{
						numWorkDays++;
						String temp[] = rs.getString(1).split(",");
						for(String id : temp)
						{
							if(all.get(id)==null)
								{
									all.put(id,1);
									numStus++;
								}
							else
								{
									int days = all.get(id);
									all.put(id,days+1);
									}
							}
						}
					}
				catch(Exception e)
				{
					}
				}
			String students[] = new String[numStus];
			int days[] = new int[numStus];
			Set<Map.Entry<String,Integer>> allValues = all.entrySet();
			int i=0;
			for(Map.Entry<String,Integer> stu : allValues)
			{
				students[i]=stu.getKey();
				days[i]=stu.getValue();
				i++;
				}
			for(int ii=0;ii<numStus;ii++)
			{
				int temp = ii;
				for(int j=ii;j<numStus;j++)
				{
					if(days[temp]<days[j])
						temp = j;
					}
				int temp1= days[temp];
				days[temp] = days[ii];
				days[ii] = temp1;
				String temp2 = students[temp];
				students[temp]=students[ii];
				students[ii]=temp2; 
				}
	out.print("<center>");
	out.print("Total number of working days : "+numWorkDays+"<br />");
	out.print("<table border='1' id = 'report' width='300'>");
	out.print("<th>ID</th><th>#Absentees</th>");
	int a=0;
	for(int k=0;k<students.length;k++)
	{
		if(a%2!=0)
			out.print("<tr><td>"+students[k]+"</td><td>"+days[k]+"</td></tr>");			
		else
			out.print("<tr bgcolor='#F5F5F5'><td>"+students[k]+"</td><td>"+days[k]+"</td></tr>");
		a++;
		}
	%>
	</table> 
	</center>
	</div>
