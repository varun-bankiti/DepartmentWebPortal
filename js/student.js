
String.prototype.replaceAll = function(str1, str2, ignore) 
{
	return this.replace(new RegExp(str1.replace(/([\/\,\!\\\^\$\{\}\[\]\(\)\.\*\+\?\|\<\>\-\&])/g,"\\$&"),(ignore?"gi":"g")),(typeof(str2)=="string")?str2.replace(/\$/g,"$$$$"):str2);
}
function saveAns(quesId,course){ 
	var answer=document.getElementById("new_ansv_"+quesId).value;
	if((answer=="")||(answer==null))
		alert("Write Something to Post");
	else{
		answer=answer.replaceAll("+","%2B");
		save_ans=new XMLHttpRequest();
		save_ans.onreadystatechange=function()
		{
			if (save_ans.readyState==4 && save_ans.status==200){
					if(save_ans.responseText==0){
						document.getElementById("new_ans_"+quesId).innerHTML="Failes To Post Answer. Kindly Try Again<textArea onfocus=Maximize('"+quesId+"') onblur=Minimize('"+quesId+"') id='new_ansv_"+quesId+"' placeholder='Write Answer Here...' style='resize:none;' type='text' rows=1 cols=30></textArea><input style='display:none;' id='Post_Ans_Button_"+quesId+"' type='button' value='Post' onclick=saveAns('"+quesId+"','"+course+"')>";
						}
					else{
						document.getElementById("new_ans_"+quesId).innerHTML=save_ans.responseText+"<textArea onfocus=Maximize('"+quesId+"') onblur=Minimize('"+quesId+"') id='new_ansv_"+quesId+"' placeholder='Write Answer Here...' style='resize:none;' type='text' rows=1 cols=30></textArea><input style='display:none;' id='Post_Ans_Button_"+quesId+"' type='button' value='Post' onclick=saveAns('"+quesId+"','"+course+"')>";
						}
				}
		}
		url="saveAns.jsp?answer="+answer+"&ques_id="+quesId;
		save_ans.open("GET",url,true);
		save_ans.send();
	}
}
	
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
	function hidestar(o){
		for(var x=1;x<=5;x++)
		document[o+x].style.display="none";
		}
	function setrate(val,ansr_id)
	{
		save_rating=new XMLHttpRequest();
		save_rating.onreadystatechange=function()
		{
			if (save_rating.readyState==4 && save_rating.status==200){
				var x='i'+ansr_id;
				var y='j'+ansr_id;
				selstar(x,save_rating.responseText);
				hidestar(y);
				document.getElementById(ansr_id+"_Rate_Text").innerHTML="";
				}
		}
		url="save_rating.jsp?value="+val+"&ansr_id="+ansr_id;
		save_rating.open("GET",url,true);
		save_rating.send();
		}
	function show_ansdiv(div){
		document.getElementById(div).style.display="block";
		document.getElementById(div+"s").style.display="none";
		document.getElementById(div+"h").style.display="block";
	}
	function hide_ansdiv(div){
		document.getElementById(div).style.display="none";
		document.getElementById(div+"s").style.display="block";
		document.getElementById(div+"h").style.display="none";
	}	
	
function Maximize(id){
	document.getElementById("new_ansv_"+id).rows=4;
	document.getElementById("new_ansv_"+id).cols=60;
	document.getElementById("Post_Ans_Button_"+id).style.display="block";
	}
function Minimize(id){
	if((document.getElementById("new_ansv_"+id).value=="")||(document.getElementById("new_ansv_"+id).value==null)){
		document.getElementById("new_ansv_"+id).rows=1;
		document.getElementById("new_ansv_"+id).cols=30;
		document.getElementById("Post_Ans_Button_"+id).style.display="none";
		}
	}
function toggle(id){
	if (id=="discussion"){
		document.getElementById("discussion").style.display="block";
		document.getElementById("post_ques").style.display="none";
		document.getElementById("first").src="imgs/dis3.jpg";
		document.getElementById("second").src="imgs/post1.jpg";
	}
	else{
		document.getElementById("post_ques").style.display="block";
		document.getElementById("discussion").style.display="none";
		document.getElementById("second").src="imgs/post2.jpg";
		document.getElementById("first").src="imgs/dis4.jpg";
		}
	}
function postQuestion()
{
	if((document.getElementById("question").value=="")||(document.getElementById("question").value==null))
		{document.getElementById("display").innerHTML="<font color='red'>Question cannot be Empty</font>";
		return false;}
	else{
		question=document.getElementById("question").value;
		question=question.replaceAll("+","%2B");
		postQuestion=new XMLHttpRequest();
		postQuestion.onreadystatechange=function()
		{
			if (postQuestion.readyState==4 && postQuestion.status==200){
					if(postQuestion.responseText==1){
						alert("Question Posted Successfully");
						window.location.href="";
						}
				}
		}
		url="postQuestion.jsp?question="+question;
		postQuestion.open("GET",url,true);
		postQuestion.send();									
		}
}

function take_attendance()
{
	if (window.XMLHttpRequest)
  {	// code for IE7+, Firefox, Chrome, Opera, Safari
  attend=new XMLHttpRequest();
  }
else
  {// code for IE6, IE5
  attend=new ActiveXObject("Microsoft.XMLHTTP");
  }
	var b=document.getElementById("classDate");
	var clss = b.elements[0].value;
	var date = b.elements[1].value;
	if(clss=="None")
		{
			document.getElementById("studentDetails").innerHTML="<font color='red' ><center>Please select class</center></font>";
			return false;
			}
	attend.onreadystatechange=function()
	{
	if (attend.readyState==4 && attend.status==200)
		{
			document.getElementById("studentDetails").innerHTML=attend.responseText;
			}
		}
	attend.open("GET","StudAttenList.jsp?clss="+clss+"&date="+date,true);
	attend.send();
}
function post_attendance()
{if (window.XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari
  attend1=new XMLHttpRequest();
  }
else
  {// code for IE6, IE5
  attend1=new ActiveXObject("Microsoft.XMLHTTP");
  }
	var clss = document.getElementById("clss").value;
	var date = document.getElementById("inputField").value;
	str="";
	var b=document.getElementById("attendance");
	for(i=0;i<(b.length)-1;++i)
		{
			str=str+b.elements[i].checked+" ";
			}	
	attend1.onreadystatechange=function()
	{
	if (attend1.readyState==4 && attend1.status==200)
		{
			document.getElementById("studentDetails").innerHTML=attend1.responseText;
			}
		}
	attend1.open("GET","EnterAtten.jsp?report="+str+"&clss="+clss+"&date="+date,true);
	attend1.send();
}
function view_attendance()
{if (window.XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari
  view=new XMLHttpRequest();
  }
else
  {// code for IE6, IE5
  view=new ActiveXObject("Microsoft.XMLHTTP");
  }
	str="";
	var b=document.getElementById("classDate");
	for(i=0;i<(b.length)-1;++i)
		{
			str=str+b.elements[i].value+",";
			}
	if(b.elements[0].value=="None")
		document.getElementById("attendReport").innerHTML="<font color='red' size='10'><center>Please select class</center></font>";
	view.onreadystatechange=function()
	{
	if (view.readyState==4 && view.status==200)
		{
			document.getElementById("attendReport").innerHTML=view.responseText;
			}
		}
	view.open("GET","showAtten.jsp?clsDate="+str,true);
	view.send();
}
function editedAtten()
{if (window.XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari
  attend1=new XMLHttpRequest();
  }
else
  {// code for IE6, IE5
  attend1=new ActiveXObject("Microsoft.XMLHTTP");
  }
	var clss = document.getElementById("clss").value;
	var date = document.getElementById("date").value;
	str="";
	var b=document.getElementById("attendance");
	for(i=0;i<(b.length);++i)
		{
			str=str+b.elements[i].checked+" ";
			}	
	attend1.onreadystatechange=function()
	{
	if (attend1.readyState==4 && attend1.status==200)
		{
			document.getElementById("attenReport").innerHTML=attend1.responseText;
			}
		}
	attend1.open("GET","submitEditedAtten.jsp?report="+str+"&clss="+clss+"&date="+date,true);
	attend1.send();
}
function statisticsValidation()
{
	if (window.XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari
  attend1=new XMLHttpRequest();
  }
else
  {// code for IE6, IE5
  attend1=new ActiveXObject("Microsoft.XMLHTTP");
  }
	var clss = document.getElementById("clss").value;
	var fromDate = document.getElementById("inputField1").value;
	var toDate = document.getElementById("inputField").value;
	if(clss=="None")
		{
			document.getElementById("statisticsReport").innerHTML="<font color='red' ><center>Please select class</center></font>";
			return false;
			}
	attend1.onreadystatechange=function()
	{
	if (attend1.readyState==4 && attend1.status==200)
		{
			document.getElementById("statisticsReport").innerHTML=attend1.responseText;
			}
		}
	attend1.open("GET","showAttenStats.jsp?cls="+clss+"&fromDate="+fromDate+"&toDate="+toDate,true);
	attend1.send();

	}
function marks()
{
	if (window.XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari
  mark=new XMLHttpRequest();
  }
else
  {// code for IE6, IE5
  mark=new ActiveXObject("Microsoft.XMLHTTP");
  }
	var clss = document.getElementById("clss").value;
	var exam = document.getElementById("exam").value;
	var subject = document.getElementById("subject").value;
	if(clss=="None"|| exam=="None" || subject=="None")
		{
			document.getElementById("studentDetails").innerHTML="<font color='red' ><center>*** All fields are mandatory ***</center></font>";
			return false;
			}
	mark.onreadystatechange=function()
	{
	if (mark.readyState==4 && mark.status==200)
		{
			document.getElementById("studentDetails").innerHTML=mark.responseText;
			}
		}
	mark.open("GET","StudMarksList.jsp?clss="+clss+"&exam="+exam,true);
	mark.send();
}
function submit_marks(count)
{
	if (window.XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari
  marks=new XMLHttpRequest();
  }
else
  {// code for IE6, IE5
  marks=new ActiveXObject("Microsoft.XMLHTTP");
  }
	var clss = document.getElementById("clss").value;
	var exam = document.getElementById("exam").value;
	var subject = document.getElementById("subject").value;
	str="";
	for(i=0;i<count;++i)
		{
			str=str+document.getElementById('m'+i).value+" ";
			}	
	marks.onreadystatechange=function()
	{
	if (marks.readyState==4 && marks.status==200)
		{
			document.getElementById("studentDetails").innerHTML=marks.responseText;
			}
		}
	url = "EnterMarks.jsp?marks="+str+"&clss="+clss+"&exam="+exam+"&subject="+subject;
	marks.open("GET",url,true);
	marks.send();
}
function viewMarks()
{if (window.XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari
	mark=new XMLHttpRequest();
  }
else
  {// code for IE6, IE5
  mark=new ActiveXObject("Microsoft.XMLHTTP");
  }
	var id=document.getElementById("id").value;
	var exam=document.getElementById("exam").value;
	var subject=document.getElementById("subject").value;
	if(id=="" || exam=="None" || subject=="None")
	{
		document.getElementById("showMarks").innerHTML="<font color='red' ><center>*** All fields are mandatory ***</center></font>";
		return false;
		}
	mark.onreadystatechange=function()
	{
	if (mark.readyState==4 && mark.status==200)
		{
			document.getElementById("showMarks").innerHTML=mark.responseText;
			}
		}
	url="showMarks.jsp?id="+id+"&exam="+exam+"&subject="+subject;
	mark.open("GET",url,true);
	mark.send();
}
