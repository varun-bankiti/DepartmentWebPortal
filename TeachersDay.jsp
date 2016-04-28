<%-- 
    Document   : index
    Created on : 20 Aug, 2013, 10:49:42 PM
    Author     : Varun
--%>
<%
String user=(String)session.getAttribute("user");
if(user!=null){
%>

<jsp:include page="top.jsp" />
<div id="content" style="height:1000px;">	
	<style>
	#details{font-family:"Lucida Sans Unicode", "Lucida Grande", Sans-Serif;font-size:12px;text-align:left;border-collapse:collapse;margin:20px;}#details th{border:1px solid white;font-size:13px;font-weight:normal;background:#b9c9fe;border-top:2px solid #aabcfe;border-bottom:1px solid #fff;color:#039;padding:8px;}#details td{text-align:center;border:1px solid white;background:#e8edff;border-bottom:1px solid #fff;color:#669;border-top:1px solid transparent;padding:8px;}#details tr:hover td{background:#d0dafd;color:#339;}
	</style>
<table id="details" style="margin-left:60px;flaot:left;margin-top:100px;">
<tr><th colspan=2 align=center>Class Wise Collected Money</th></tr>
<tr><th align=center>Class</th><th align=center>Collected Money</th></tr>
<tr><td>Sigma-1(CSE-4B)</td><td width=120>1310</td></tr>
<tr><td>Sigma-2(CSE-4C)</td><td>1310</td></tr>
<tr><td>Sigma-3(CSE-4D)</td><td>1390</td></tr>
<tr><td>Sigma-4(CSE-4E)</td><td>890</td></tr>
<tr><td>Sigma-5(CSE-3A)</td><td>1040</td></tr>
<tr><td>Sigma-6(CSE-3B)</td><td>1220</td></tr>
<tr><td>Sigma-7(CSE-3C)</td><td>780</td></tr>
<tr><td>Sigma-8(CSE-3D)</td><td>1950</td></tr>
<tr><td>Sigma-9(CSE-3E)</td><td>1470</td></tr>
<tr><td>Sigma-10(CSE-2A)</td><td>1526</td></tr>
<tr><td>Sigma-11(CSE-2B)</td><td>750</td></tr>
<tr><td>Sigma-12(CSE-2C)</td><td>1525</td></tr>
<tr><td>Sigma-14(CSE-3A)</td><td>1010</td></tr>
<tr><th>Grand Total</th><td>16171</td></tr>
</table>
<table id="details" style="float:right;margin-right:60px;margin-top:-550px">
<tr><th colspan=2 align=center>Details of Money Used</th></tr>
<tr><th align=center width=200>Event</th><th align=center width=300>Money Incurred</th></tr>
<tr><th>Gifts(22 Momentos)</th><td>7050</td></tr>
<tr><th>Jilebe (30 Kg*90)</th><td>3060</td></tr>
<tr><th>Ground Nuts (20 Kg*90)</th><td>1800</td></tr>
<tr><th>Decoration Items</th><td>570</td></tr>
<tr><th>Carpets Rent</th><td>550</td></tr>
<tr><th>Stickers & Banner Printing</th><td>385</td></tr>
<tr><th>Cool Drinks(For Faculty)</th><td>360</td></tr>
<tr><th>Sweets(For Faculty)</th><td>180</td></tr>
<tr><th>Dal Mixture(2*!20)</th><td>240</td></tr>
<tr><th>Ballons(3*70) + Double Plaster(20)</th><td>230</td></tr>
<tr><th>Invitation Cards</th><td>240</td></tr>
<tr><th>Charges & Food @ Vempalli & Kadapa</th><td>1090</td></tr>
<tr><th>Packing Covers</th><td>100</td></tr>
<tr><th>Sketches & Ballons(1 Pack)+Pins</th><td>118</td></tr>
<tr><th>Auto Charges With Luggage</th><td>100</td></tr>
<tr><th>LollyPops(Welcome For Faculty)</th><td>80</td></tr>
<tr><th>Spoons(2 Dozens)</th><td>80</td></tr>
<tr><th>Petrol</th><td>50</td></tr>
<tr><th>Thermocol</th><td>50</td></tr>
<tr><th>Plastic Glasses</th><td>40</td></tr>
<tr><th>Glitters + Gum</th><td>30</td></tr>
<tr><th>Thamala Pakulu & Vakkalu</th><td>35</td></tr>
<tr><th>Paper Plates</th><td>20</td></tr>
<tr><td></td><td></td></tr>
<tr><th>Grand Total</th><td>16578</td></tr>
</table>
</div></div><CENTER><div id="footer" style="height:30px;width:1000px;color:white;text-shadow:2px 2px 5px red;font-size:18px;">Copyright &copy <a href="http://cse.rkv.rgukt.in" style="text-decoration:none;color:white;">CS-RKV</a> 2013</div></CENTER>
<%}
else{
	String site = new String("index.jsp");
	response.setStatus(response.SC_MOVED_TEMPORARILY);
	response.setHeader("Location", site);
	}
	%>
