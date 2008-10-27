<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.ArrayList"%>
<%@page import="logic.Punkt"%>
<%@page import="logic.Newton"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="images/math.gif" rel="SHORTCUT ICON">
<link href="style.css" rel="stylesheet" type="text/css">
<title>derivato - Wybór pliku z danymi</title>
</head>
<body>
<%ArrayList<Punkt> ob=(ArrayList<Punkt>) request.getSession().getAttribute("ob");
Newton in=(Newton) request.getSession().getAttribute("interpolacja");%>
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
			<span class="naglowek">Obliczanie pochodnej z wielomianu interpolacyjnego</span><br><br>
			<form action="show_nderiv.jsp">
				<table>
					<tr>
						<td align="right">
							<b>Funkcja interpolująca</b>
						</td>
						<td>
							<input type="text" name="wyr" readonly="readonly" title="Wzór funkcji interpolującej w postaci Newtona" value="<%=in.getFormula() %>" size="50">
						</td>
					</tr>
					<tr>
						<td align="right">
							<b><var>x<sub>0</sub></var></b>
						</td>
						<td>
							<select name="x" title="Punkt różniczkowania" style="width: 121px">
								<option>wszystkie</option>
								<%for (int i=0; i<ob.size(); i++){ %>
								<option><%=ob.get(i).getX() %> </option>
								<%} %>
							</select>								
						</td>
					</tr>
					<tr>
						
						<td align="right">
							<b><var>h</var></b> 
						</td>
						<td>
							<input type="text" name="h" title="Krok różniczkowania, np. 0.01" value="0.001" ondblclick="value=''" size="15">
						</td>
					</tr>
					<tr>
					<td align="right">
						<b>Precyzja</b>
					</td>
					<td>
						<input type="text" name="precyzja" title="Liczba miejsc po przecinku" value="6" ondblclick="value=''" size="15">
					</td>
				</tr>
					<tr>
						<td align="right">
							<b>Pochodna</b>
						</td>
						<td>
							<select name="pochodna" title="Stopień pochodnej" style="width: 121px">
								<option>wszystkie</option>
								<option>pierwsza</option>
								<option>druga</option>
							</select>
						</td>
					</tr>
					<tr>
						<td align="right">
							<b>Iloraz</b>
						</td>
						<td>
							<select name="iloraz" title="Iloraz różnicowy" style="width: 121px">
								<option>wszystkie</option>
								<option>progresywny</option>
								<option>wsteczny</option>
								<option>centralny</option>
							</select>
						</td>
					</tr>
					<tr>
						<td align="right" colspan="2">
							<input type="reset" value="Reset">
							<input type="submit" value="Oblicz">
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