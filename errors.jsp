<%@page isErrorPage="true" %>
      <html>
	<head><title>Error Page.</title></head>
		<%if((exception.toString()).equals("java.lang.ArithmeticException: / by zero"))
				{%><jsp:include page="unauthorized.jsp"  /><%}
			 else {%><jsp:include page="index.jsp"  /><%}
			
		 %>
	</body>
</html>
