<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="oblicz.Pochodna"%>
<html>
<%! Pochodna p=new Pochodna();%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Kalkuluj</title>
</head>
<body>
<jsp:useBean id="licz" class="web.CountBean" scope="session"/>
<jsp:setProperty name="licz" property="*"/>
<form method="post" action="licz.jsp">
<table align="center" bgcolor="gray">
	<tr>
		<td bgcolor="yellow">
			Wyrażenie 
		</td>
		<td>
			<input type="text" name="wyr" size="50">
		</td>
	</tr>
	<tr>
		<td bgcolor="yellow" align="center">
			x<sub>0</sub>
		</td>
		<td>
			<input type="text" name="x" size="15">
		</td>
	</tr>
	<tr>
		<td bgcolor="yellow" align="center">
			h 
		</td>
		<td>
			<input type="text" name="h" size="15">
		</td>
	</tr>
	<tr>
		<td>
			<select name="pochodna">
				<option>wstecznie</option>
				<option>centralnie</option>
				<option>wstecznie</option>
			</select>
		</td>
	</tr>
	<tr><td></td><td align="right"><input type="reset" value="Wyczyść"> <input type="submit" size="10" value="Oblicz">
	</td></tr>
</table>
</form>
<br><br>
<%if (licz.getWyr()!=null && licz.getX()!=null && licz.getH()!=null) {%>
<table align="center" border="1" bordercolor="orange" width="300">
	<tr>
		<td>
			Funkcja x
		</td>
		<td>
			<%=licz.getWyr() %>  &nbsp; <%=licz.getPochodna() %>
		</td>
	</tr>
	<tr>
		<td>
			x<sub>0</sub>	
		</td>
		<td>
			<%=licz.getX() %>
		</td>
	</tr>
	<tr>
		<td>
			h
		</td>
		<td>
			<%=licz.getH() %>
		</td>
	</tr>	
	<tr>
		<td>
			Wartość pochodnej
		</td>
		<td>
			<%=p.derivCentral(licz.getWyr(),Double.parseDouble(licz.getX()),Double.parseDouble(licz.getH()), 1) %>
		</td>
	</tr>
</table>
<%} %>
<br><br>

<table align="center"><tr><td><img src=imageMaker1?></td></tr></table>
</body>
</html>