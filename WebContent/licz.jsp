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
<link href="images/math.gif" rel="SHORTCUT ICON">
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
				<a href="index2.jsp" title="Obliczanie pochodnej funkcji zadanej punktami">Dyskretnie</a>
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
			<table>
				<tr>
					<td align="right">
						<b>Funkcja <var>x</var></b> 
					</td>
					<td>
						<input type="text" name="wyr" id="wyr1" title="Wzór funkcji x, np. (cos(x)^2)*x^3" value="<%=licz.getWyr()!=null?licz.getWyr():""  %>" ondblclick="value=''" size="50">
					</td>
				</tr>
				<tr>
					<td align="right">
						<b><var>x</var><sub>0</sub></b>
					</td>
					<td>
						<input type="text" name="x" title="Punkt różniczkowania, np. 3.453" value="<%=licz.getX()!=null?licz.getX():"" %>" ondblclick="value=''" size="15" >
					</td>
				</tr>
				<tr>
					<td align="right">
						<b><var>h</var></b> 
					</td>
					<td>
						<input type="text" name="h" title="Krok różniczkowania, np. 0.001" value="<%=licz.getH()!=null?licz.getH():"0.001" %>" ondblclick="value=''" size="15">
					</td>
				</tr>
				<tr>
					<td align="right">
						<b>Precyzja</b>
					</td>
					<td>
						<input type="text" name="precyzja" title="Liczba miejsc po przecinku" value="<%=licz.getPrecyzja()!=null?licz.getPrecyzja():"6" %>" ondblclick="value=''" size="15">
					</td>
				</tr>
				<tr>
					<td align="right">
						<b>Pochodna</b>
					</td> 
					<td>
						<select name="pochodna" title="Stopień pochodnej" style="width: 121px">
							<option>pierwsza</option>
							<option>druga</option>
							<option selected="selected">wszystkie</option>
						</select>
					</td>
				</tr>
				<tr>
					<td align="right">
						<b>Iloraz</b>
					</td> 
					<td>
						<select name="iloraz" title="Iloraz różnicowy" style="width: 121px">
							<option>wsteczny</option>
							<option>centralny</option>
							<option>do przodu</option>
							<option selected="selected">wszystkie</option>
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
			<p>2008 - Created by Wojciech Żaboklicki </p>
		</div>
	</div>

</body>
</html>