Discription
<%
String course=(String)session.getAttribute("course");
out.println(course);
%>
<%
					if(course.equals("CS2201")){%>
					<jsp:include page="Courses/Discription/CS2201.jsp"/>
					<%}
					else if(course.equals("CS2202")){%>
					<jsp:include page="Courses/Discription/CS2202.jsp"/>
					<%}
					else if(course.equals("CS2203")){%>
					<jsp:include page="Courses/Discription/CS2203.jsp"/>
					<%}
					else if(course.equals("CS2204")){%>
					<jsp:include page="Courses/Discription/CS2204.jsp"/>
					<%}
					else if(course.equals("CS2101")){%>
					<jsp:include page="Courses/Discription/CS2101.jsp"/>
					<%}
					else if(course.equals("CS2102")){%>
					<jsp:include page="Courses/Discription/CS2102.jsp"/>
					<%}%>
