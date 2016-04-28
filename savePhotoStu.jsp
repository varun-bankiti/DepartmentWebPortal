<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.output.*" %>
<%@ page import="java.sql.*"%>
<%
	Connection con = null;
	Class.forName("com.mysql.jdbc.Driver");
	con= DriverManager.getConnection("jdbc:mysql://localhost/cse?user=root&password=cse");
	PreparedStatement ps = null;
	String qry;
   File file ;
   int maxFileSize = 500000 * 1024;
   int maxMemSize = 500000 * 1024;
   ServletContext context = pageContext.getServletContext();
   String filePath = "C:\\xampp\\tomcat\\webapps\\ROOT\\Portal\\Photos\\";
   String photo="/Portal/Photo/";
	String id=(String)session.getAttribute("id");//######################
	id=id.toUpperCase();
	 // Verify the content type
   String contentType = request.getContentType();
   if ((contentType.indexOf("multipart/form-data") >= 0)) {

      DiskFileItemFactory factory = new DiskFileItemFactory();
      // maximum size that will be stored in memory
      factory.setSizeThreshold(maxMemSize);
      // Location to save data that is larger than maxMemSize.
      factory.setRepository(new File("C:\\temp"));

      // Create a new file upload handler
      ServletFileUpload upload = new ServletFileUpload(factory);
      // maximum file size to be uploaded.
      upload.setSizeMax( maxFileSize );
      try{ 
         // Parse the request to get file items.
         List fileItems = upload.parseRequest(request);

         // Process the uploaded file items
         Iterator i = fileItems.iterator();
         while ( i.hasNext () ) 
         {
            FileItem fi = (FileItem)i.next();
            if ( !fi.isFormField () )	
            {
            // Get the uploaded file parameters
            String fieldName = fi.getFieldName();
            String fileName = fi.getName();
            boolean isInMemory = fi.isInMemory();
            long sizeInBytes = fi.getSize();
            // Write the file
            if( fileName.lastIndexOf("\\") >= 0 ){
            file = new File( filePath + id) ;
            }else{
            file = new File( filePath + id) ;
            }
            fi.write( file ) ;
            photo=photo+id;
            }
         }
      }catch(Exception ex) {
         System.out.println(ex);
      }
   }
	qry="update student set photo=? where stu_id=?";
	ps=con.prepareStatement(qry);
	ps.setString(1,photo);
	ps.setString(2,id);
	try{int result1=ps.executeUpdate();
	if(result1==1){
		session.invalidate();
		String site = new String("index.jsp");
		response.setStatus(response.SC_MOVED_TEMPORARILY);
		response.setHeader("Location", site);
		}
	}
	catch(Exception e){out.println(e);}
%>
