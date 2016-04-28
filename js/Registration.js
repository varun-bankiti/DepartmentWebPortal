function validateKeyName(e)
{
	var key;
	var keychar;
	if (window.event)
	key = window.event.keyCode;
	else if (e)
	key = e.which;
	else
	return true;
	keychar = String.fromCharCode(key);
	keychar = keychar.toLowerCase();
	// control keys
	if ((key==null) || (key==0) || (key==8) || 
	(key==9) || (key==13) || (key==27) )
	return true;
	// alphas and numbers
	else if ((" abcdefghijklmnopqrstuvwxyz").indexOf(keychar) > -1) return true;
	else
	return false;
}
function validateKeyPhn(e)
{
	var key;
	var keychar;
	if (window.event)
	key = window.event.keyCode;
	else if (e)
	key = e.which;
	else
	return true;
	keychar = String.fromCharCode(key);
	keychar = keychar.toLowerCase();
	// control keys
	if ((key==null) || (key==0) || (key==8) || 
	(key==9) || (key==13) || (key==27) )
	return true;
	// alphas and numbers
	else if ((key==43)&&(document.getElementById("stu_phn").value.length)==0) return true;
	else if ((("0123456789").indexOf(keychar) > -1)&&(document.getElementById("in").value.length)>=3) return true;
	else
	return false;
}
function validate_photo(){
	var photo=document.getElementById("file0").value;
	var photos=new Array();
	photos=photo.split(".");
	extensions=["jpg","png","jpeg","gif","bmp"]
	var check=0;
	end=photos[photos.length-1].toLowerCase()
	for(i=0;i<5;i++) {
		if(extensions[i]==end)
			check=1;
		}
	
	if((photo=="")||(photo==null)){
		document.getElementById("photo_error").innerHTML="<font color='red'>Upload a photo</font>";
		return false;
	}
	else if(check==0){ document.getElementById("photo_error").innerHTML="<font color='red'>* Invalid Photo(png,jpg,jpeg,gif,bmp)</font>";return false}
	else {document.getElementById("photo_error").innerHTML="<font color='Green'>Ok</font>";return true;}
	}
function validate_uname(id,error_dis)
{

	var name = document.getElementById(id).value;
	if ((id=="stu_name")||(id=="fac_name")||(id=="com_name")) var che_name = /^[a-zA-Z][a-zA-Z0-9\_\-\.\" "]*$/ ;
        else var che_name = /^[a-zA-Z][a-zA-Z0-9\_\-\.]*$/ ;
        if(name.match(che_name)==null)
        {
        document.getElementById(error_dis).innerHTML="<font color='red'>Enter valid username(Ex : R094321)</font>";
        return false;
        }
        else if(name.length<4 || name.length>20)
        {
        document.getElementById(error_dis).innerHTML="<font color='red'>Size 5-10 characters</font>";
        return false;
        }
        else
        {
        document.getElementById(error_dis).innerHTML="<font color='green'>OK</font>";
        return true;
        }
}
function validate_name(id,error_dis)
{
	var name = document.getElementById(id).value;
	if ((id=="stu_name")) var che_name = /^[\" "\""]*$/ ;
        else var che_name = /^[\""\" "]*$/ ;
        if(!(name.match(che_name)==null))
        {
        document.getElementById(error_dis).innerHTML="<font color='red'>Enter  name</font>";
        return false;
        }
        else
        {
        document.getElementById(error_dis).innerHTML="<font color='green'>OK</font>";
        return true;
        }
}

function validate_email(id,error_dis)
{

	var name = document.getElementById(id).value;
	var che_name = /^([a-zA-Z0-9\_\-\.]*\@[a-zA-Z0-9\-]*\.[a-zA-Z]{2,4})?$/i ;
	if(name=="")
	{
		document.getElementById(error_dis).innerHTML="<font color='red'>Please Enter Email</font>";
		return false;
	}
	else if(name.match(che_name)==null)
	{
		document.getElementById(error_dis).innerHTML="<font color='red'>Enter Valid Email</font>";
		return false;
	}
	else
	{
		document.getElementById(error_dis).innerHTML="<font color='green'>OK</font>";
		return true;
	}
}
function validate_phnum(id,error_dis)
{
	var che_name = /^[0-9]*$/;
	name=document.getElementById(id).value;
	if(name.match(che_name)==null){
		document.getElementById(error_dis).innerHTML="<font color='red'>only numbers</font>";
		return false;
	}
	else if(name.length<9 || name.length>12)
	{
		document.getElementById(error_dis).innerHTML="<font color='red'>9 to 12 digits only</font>";
		return false;
	}
	else
        {
        document.getElementById(error_dis).innerHTML="<font color='green'>OK</font>";
        return true;
	}
}
function validate_pass(id,error_dis)
{

	name=document.getElementById(id).value;
	if(name.length<5 || name.length>20)
        {
        document.getElementById(error_dis).innerHTML="<font color='red'>Size 5-10 characters</font>";
        return false;
        }
	else if(name.match(' ')!=null)
        {
        document.getElementById(error_dis).innerHTML="<font color='red'>empty space is not allowed</font>";
        return false;
        }
	else
        {
        document.getElementById(error_dis).innerHTML="<font color='green'>OK</font>";
        return true;}
}
function validate_pass_f(id,id_conf,error_dis1,error_dis2){
	validate_pass(id,error_dis1);
	check(id,id_conf,error_dis2);
	}

function check(id,id_conf,error_dis)
{

	name=document.getElementById(id).value;
	if(document.getElementById(id).value!=document.getElementById(id_conf).value){
		document.getElementById(error_dis).innerHTML="<font color='red'>password does not match</font>";
	return false;}
	else if(name.length<5 || name.length>20)
        {
        document.getElementById(error_dis).innerHTML="<font color='red'>Size 5-10 characters</font>";
        return false;
        }
	else if(name.match(' ')!=null)
        {
        document.getElementById(error_dis).innerHTML="<font color='red'>empty space is not allowed</font>";
        return false;
        }
        
	
	else
        {
        document.getElementById(error_dis).innerHTML="<font color='green'>OK</font>";
        return true;}
}
function validateClass()
{
	if(document.getElementById("clss").value=="None")
		{
		document.getElementById("clssError").innerHTML="<font color='red'>Select class</font>";
			return false;
			}
	else
	{
		document.getElementById("clssError").innerHTML="<font color='green'>OK</font>";
			return true;
			}
	}
function validateDob()
{
	if((document.getElementById("dob").value=="")||(document.getElementById("dob").value==null))
		{
		document.getElementById("dob_error").innerHTML="<font color='red'>Select DOB</font>";
		return false;
			}
	else
		{
		document.getElementById("dob_error").innerHTML="<font color='green'>OK</font>";
		return true;
		}
	}

function registration(ref)
{
	if(validate_uname("stu_id","id_error")&&validate_name("stu_name","name_error")&&validate_pass("stu_pass","pass_error1")&&check("stu_pass","stu_passc","pass_error")&&validateClass()&&validateDob()&&validate_email("stu_mail","mail_error")&&validate_phnum("stu_phn","phnum_error")&&validate_photo())
	{
	stu_id=document.getElementById("stu_id").value;
	stu_name=document.getElementById("stu_name").value;
	stu_pass=document.getElementById("stu_pass").value;
	stu_mail=document.getElementById("stu_mail").value;
	stu_dob=document.getElementById("dob").value;
	stu_course=document.getElementById("stu_course").value;
	stu_cls=document.getElementById("clss").value;
	stu_add=document.getElementById("stu_add").value;
	stu_phn=document.getElementById("stu_phn").value;
	regis=new XMLHttpRequest(); 
	regis.onreadystatechange=function()
	  {
	  if (regis.readyState==4 && regis.status==200)
	    {
	    if(regis.responseText==1){
			document.getElementById("photo_form").submit();
			}
		else{document.getElementById("p").innerHTML="<font color='red'>Unable to Upload Photo</font>";}
	    }
	  }
	url="submitReg.jsp?id="+stu_id+"&name="+stu_name+"&pass="+stu_pass+"&cls="+stu_cls+"&course="+stu_course+"&phn="+stu_phn+"&dob="+stu_dob+"&mail="+stu_mail+"&add="+stu_add+"&ref="+ref;
	regis.open("GET",url,true);
	regis.send();
	}
	else{validate_uname("stu_id","id_error");validate_name("stu_name","name_error");validate_pass("stu_pass","pass_error1");check("stu_pass","stu_passc","pass_error");validateClass();validateDob();validate_email("stu_mail","mail_error");validate_phnum("stu_phn","phnum_error");}
	}
function facRegis(ref)
{
	if(validate_uname("stu_id","id_error")&&validate_name("stu_name","user_error")&&validate_pass("stu_pass","pass_error1")&&check("stu_pass","stu_passc","pass_error")&&validateDob()&&validate_email("stu_mail","mail_error")&&validate_phnum("stu_phn","phnum_error")&&validate_photo())
	{
	fac_id=document.getElementById("stu_id").value;
	fac_name=document.getElementById("stu_name").value;
	fac_pass=document.getElementById("stu_pass").value;
	fac_mail=document.getElementById("stu_mail").value;
	fac_dob=document.getElementById("dob").value;
	fac_add=document.getElementById("stu_add").value;
	fac_phn=document.getElementById("stu_phn").value;
	regis=new XMLHttpRequest(); 
	regis.onreadystatechange=function()
	  {
	  if (regis.readyState==4 && regis.status==200)
	    {
	    document.getElementById("photo_form").submit();
	    }
	  }
	url="submitReg.jsp?id="+fac_id+"&name="+fac_name+"&pass="+fac_pass+"&phn="+fac_phn+"&dob="+fac_dob+"&mail="+fac_mail+"&add="+fac_add+"&ref="+3;
	regis.open("GET",url,true);
	regis.send();
	}
	else{
		validate_uname("stu_id","id_error");validate_name("stu_name","user_error");validate_pass("stu_pass","pass_error1");check("stu_pass","stu_passc","pass_error");validateDob();validate_email("stu_mail","mail_error");validate_phnum("stu_phn","phnum_error");}
	}
