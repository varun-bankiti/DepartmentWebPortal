<style>
#container .body #notices_menu{
	width:150px;
	min-height:600px;
	border:1px solid #5294C1;
	border-right:0px;
	border-left:0px;
	border-bottom:0px;
	
	}

#notices_menu ul{
	margin-left:0px;

	font-size:10px;
	list-style-type:none;
	}
#notices_menu ul li{
	margin-left:-40px;
	padding:5px 0px;
	font-size:10px;
	font-family:comicsons;
	}
	#notices_menu h1{
	margin-left:-40px;
	padding:5px 0px;
	font-size:10px;
	font-family:comicsons;
	}
#notices_menu ul li a{
	
	color:#333333;
	display:block;
	font-size:16px;
	font-weight:bold;
	padding:7px 0 6px 40px;
	width:110px;
	text-decoration:none;
	}
#notices_menu ul li a:hover{
	-moz-background-clip:border;
	-moz-background-inline-policy:continuous;
	-moz-background-origin:padding;
	background:#0066A7 none repeat scroll 0 0;
	color:white;
	text-decoration:none;
	}
 #notices{
	font-size:10px;
	margin-left:150px;
	margin-top:-130px;
	width:750px;
	border:0px solid #5294C1;
	border-left:1px solid #5294C1;
	border-right:0px;
	border-bottom:0px;
	padding:0px 10px;
	background:url("imgs/bg2.jpg");
	height:500px;
	}
	</style>
	</head>
				
				<div id="notices_menu">
					<ul>
						<li ><a  style="background:#C0C0C0;" >Campus</a></li>
						<li ><a  href='index.jsp?page=FacultyDetails'>Faculty</a></li>
						<li ><a  style='background:purple;color:white;' href='#'>Timetable</a></li>
					</ul>
				</div>
				<div id="notices">
				<div id="timetable1" >
					<center>	<br /><br />
					<select id="class" onchange="get_timetable()">
					<option>Select Class</option>
					<%
					for(int i=1;i<13;i++)
					out.print("<option>Sigma-"+i+"</option>"); 
					out.print("<option>Sigma-14</option>");
					%>
			</select></center><br /><br />
			<div id="timetable"></div>
			</div>

   </div>
				
				</div>
	 <!-- end #mainContent --></div>
</html>
