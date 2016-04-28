		<script type="text/javascript" src="js/Registration.js" ></script></script>
<link rel="stylesheet" type="text/css" media="all" href="jsDatePick_ltr.min.css" />
<script type="text/javascript" src="jsDatePick.min.1.3.js"></script>

<script type="text/javascript">
	window.onload = function(){
		new JsDatePick({
			useMode:2,
			target:"inputField",
			dateFormat:"%d-%M-%Y"
			/*selectedDate:{				This is an example of what the full configuration offers.
				day:5,						For full documentation about these settings please see the full version of the code.
				month:9,
				year:2006
			},
			yearsRange:[1978,2020],
			limitToToday:false,
			cellColorScheme:"beige",
			dateFormat:"%m-%d-%Y",
			imgPath:"img/",
			weekStartDay:1*/
		});
	};
	
	
</script>
		
		</head>
	<body >
		<%
		String id = (String) session.getAttribute("id");
		%>
		<center><font size=6>Student Registration</font>
		<br />
		<span id="p"></span>
		<br/></center>
		<table style="margin-left:300px;">
		<tbody><tr><td width=100>ID Number : </td><td width=100><input required name="idn" id="stu_id" type="text" value="<%=id%>" readonly='true'></td><td width=150 id="id_error"></td></tr>
		<tr><td>Name : </td><td><input required name="user" onblur=validate_name(this.id,"name_error")  id="stu_name" type="text" onblur=></td><td id="name_error"></td></tr>
		<tr><td>Password  :</td><td><input required name="pswd" id="stu_pass" type="password"  onblur=validate_pass_f(this.id,"stu_passc","pass_error1","pass_error")></td><td id="pass_error1"></td></tr>
		<tr><td>Confirm Password  :</td><td><input required name="pswd" id="stu_passc" type="password" onblur=check("stu_pass",this.id,"pass_error")></td><td id="pass_error"></td></tr>
		<tr><td>Course:</td><td><select name="course" id="stu_course">
		<option value="E2">E-II</option>
		<option value="E3">E-III</option>
		<option value="E4">E-IV</option>
	</select></td></tr>



<tr><td>Branch    : </td><td>
<input type="text" value="CSE" id="branch" readonly="true" />
</td></tr>
<tr><td>Class     :</td><td>
	<select name="clss" id="clss" onchange='validateClass()'>
		<option value='None' selected="selected">Select class</option>
		<%
		for(int i=1;i<=12;i++){%>
			<option value='Sigma<%=i%>'>Sigma-<%=i%></option>);
			<%}%>
	</select></td><td id="clssError"></td></tr>
<tr><td>Date of Birth :</td><td>
<input type="text" size="12" readonly="true" id="inputField" onblur="validateDob()"/>
</td><td id="dob_error"></td></tr>
<tr><td>Address :</td><td><textarea required name="add" id="stu_add" ></textarea></td></tr>
<tr><td>Mail id :</td><td> <input required name="mail" type="text" id="stu_mail" onblur=validate_email(this.id,"mail_error")></td><td><div id="mail_error"></div></td></tr>
<tr><td>Phone No :</td><td><input required name="phone" type="text" id="stu_phn" onblur=validate_phnum(this.id,"phnum_error")> </td><td id="phnum_error"></td></tr>
<tr><form id="photo_form" method="POST" enctype="multipart/form-data" action="savePhotoStu.jsp"><td>Upload Photo</td><td><input type="file" id="file0" name="file0"></td><td><div id="photo_error"></div></td></form></tr>
<tr><td></td><td><input type="button" value="Submit" onclick=registration(1)></td></tr>
</tbody></table>
		
