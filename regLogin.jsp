
		<script type="text/javascript">
			function regLogin()
			{
				 var un=document.getElementById("username").value;
				 var pwd=document.getElementById("pwd").value;
				if(un==null || pwd==null || un=="" || pwd=="")
					{
					document.getElementById("valid").innerHTML="<center><br><font color='red'>*All fields are required</font></center>";
					return false;
					}
				else{
					uname=document.getElementById("username").value;
					pwd=document.getElementById("pwd").value;
					regLoginCheck=new XMLHttpRequest();
					regLoginCheck.onreadystatechange=function()
					{
						if (regLoginCheck.readyState==4 && regLoginCheck.status==200){
							if(regLoginCheck.responseText==1){window.location.href="stuReg.jsp";}
							else if(regLoginCheck.responseText==2){window.location.href="facReg.jsp";}
							else if(regLoginCheck.responseText==4){document.getElementById("valid").innerHTML="<center><br><font color='red'>*Already Completed Registration</font></center>";}
							else if(regLoginCheck.responseText==3){document.getElementById("valid").innerHTML="<center><br><font color='red'>*Invalid Username/Password</font></center>";}
							}
					}
					url="checkRegLogin.jsp?username="+uname+"&pwd="+pwd;
					regLoginCheck.open("GET",url,true);
					regLoginCheck.send();
				}
			}
			</script>
		<style type="text/css">
			td
			{
				text-align:center;
				}
			</style>
		<center><table style="background:lightgrey;" width="300px" height="200px"
		<tr>
			<td colspan=3><center><font size=4.5><b>Login For Register</b></font></center></td>
		</tr>
		<tr>
			
			<td height=40><font size=4>Username</font></td><td>:</td><td><input type="text" id="username" name="username" placeholder="Username"></td>
		</tr>
		<tr>
			<td height=40><font size=4>Password</font></td><td>:</td><td><input type="password" id="pwd" name="pwd" placeholder="Password"></td>
		</tr>
		<tr>
			<td colspan=3 align="center" height=40><input style="width:80px;height:30px;background:purple;color:white;font-size:18px;" type="Button" onclick=regLogin() value="Login!"></td>
		</tr>
	</table><div id="valid" style="width:300px;"></div></font></center>
		</body>
	</html>
