<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="images/math.gif" rel="SHORTCUT ICON">
<link href="style.css" rel="stylesheet" type="text/css">
<title>derivato - Wprowadzanie współrzędnych funkcji</title>
</head>
<body>

<div id="all">
	<div id="header">
		<p><span class="duzy">&nbsp;  derivato</span>
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
			<span class="naglowek">Wprowadzanie współrzędnych funkcji</span><br><br>
			<form action="wypisz.jsp">
				<table>
					<tr>
						<td align="center">
							&nbsp; <b><var>i</var></b>
						</td>
						<td align="center">
							<b><var>x<sub>i</sub></var></b>
						</td>
						<td align="center">
							<b><var>y<sub>i</sub></var></b>
						</td>
					</tr>
					<%for (int i=0; i<Integer.parseInt(request.getParameter("qty")); i++) {%>
					<tr>
						<td>
							&nbsp; <%=i %>&nbsp;
						</td>
						<td>
							<input type="text" name="x" title="x<%=i %>" ondblclick="value=''" size="15">
						</td>
						<td>
							<input type="text" name="y" title="y<%=i %>" ondblclick="value=''" size="15">
						</td>
					</tr>
					<%} %>
					<tr></tr>
					<tr>
						<td align="right" valign="bottom" colspan="3" rowspan="2">
							<input type="reset" value="Wyczyść">
							<input type="submit" value="Zapisz">
						</td>
					</tr>	
					
					
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