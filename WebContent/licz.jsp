<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="oblicz.Pochodna"%>
<html>
<head>
<%! Pochodna p=new Pochodna();%>

<script type="text/javascript">

var temp
function clear(id){
	alert(id)
	temp=document.getElementById(id).value
	document.getElementById(id).value=''
	alert(id)
}
function unclear(id){
	if (document.getElementById(id).value=='') document.getElementById(id).value=temp		
}
function reset(){
	
}
</script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="style.css" rel="stylesheet" type="text/css">
<title>derivato - Obliczanie pochodnej funkcji ze wzoru</title>
</head>
<body>
<div id="all">
	<div id="header">
		<p><span class="duzy">&nbsp;  derivato</span></p>
		<ul id="menuList">
			<li>
				<a href="index.html" title="Strona główna">Start</a>
			</li>
			<li>	
				<a href="licz.jsp" title="Obliczanie pochodnej ze wzoru funkcji">Ze wzoru</a>
			</li>
			<li>
				<a href="index2.html" title="Obliczanie pochodnej funkcji zadanej punktami">Dyskretnie</a>
			</li>
			<li>
				<a href="badania.jsp" title="Badanie dokładności różniczkowania numerycznego">Badanie</a>
			</li>
			<li>
				<a href="help.html" title="Podręcznik użytkownika">Pomoc</a>
			</li>
		</ul>
	</div>
	<div id="main">
		<div id="content">
			<span class="naglowek">Obliczanie pochodnej na podstawie wzoru</span><br><br>
			<jsp:useBean id="licz" class="web.CountBean" scope="session"/>
			<jsp:setProperty name="licz" property="*"/>
			<form method="post" action="deriv.jsp">
			<table align="center">
				<tr>
					<td align="right">
						<b>Funkcja <var>x</var></b> 
					</td>
					<td>
						<input type="text" name="wyr" id="wyr1" value="<%=licz.getWyr()!=null?licz.getWyr():""  %>" ondblclick="value=''" size="50">
					</td>
				</tr>
				<tr>
					<td align="right">
						<b><var>x<sub>0</sub></var></b>
					</td>
					<td>
						<input type="text" name="x" size="15" >
					</td>
				</tr>
				<tr>
					<td align="right">
						<b><var>h</var></b> 
					</td>
					<td>
						<input type="text" name="h" size="15">
					</td>
				</tr>
				<tr>
					<td align="right">
						<b>Pochodna</b>
					</td> 
					<td>
						<select name="pochodna" style="width: 121px">
							<option>pierwsza</option>
							<option>druga</option>
							<option>wszystkie</option>
						</select>
					</td>
				</tr>
				<tr>
					<td align="right">
						<b>Iloraz</b>
					</td> 
					<td>
						<select name="iloraz" style="width: 121px">
							<option>wsteczny</option>
							<option>centralny</option>
							<option>do przodu</option>
							<option>wszystkie</option>
						</select>
					</td>
				</tr>
				<tr><td></td><td align="right"><input type="button" value="Wyczyść" onclick="javascript:document.getElementById('wyr1').value='';"> <input type="submit" size="10" value="Oblicz">
				</td></tr>
			</table>
			</form>
			
		</div>
		</div>
		<div id="footer">
			<center><p>  Created by Wojciech Żaboklicki </p></center>
		</div>
	</div>

</body>
</html>