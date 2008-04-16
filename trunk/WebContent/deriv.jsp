<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="oblicz.Pochodna"%>
<%@page import="java.math.BigDecimal"%>

<html>
<%! Pochodna p=new Pochodna();%>


<head>
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
			<table align="center" bgcolor="gray">
				<tr>
					<td align="right">
						<b>Funkcja <var>x</var></b> 
					</td>
					<td>
						<input type="text" name="wyr" id="wyr1" value="<%=licz.getWyr()!=null?licz.getWyr():""  %>" size="50">
					</td>
				</tr>
				<tr>
					<td align="right">
						<b><var>x<sub>0</sub></var></b>
					</td>
					<td>
						<input type="text" name="x" id="x1" value="<%=licz.getX()!=null?licz.getX():"" %>" size="15" >
					</td>
				</tr>
				<tr>
					<td align="right">
						<b><var>h</var></b> 
					</td>
					<td>
						<input type="text" name="h" id="h" value="<%=licz.getH()!=null?licz.getH():"" %>" size="15">
					</td>
				</tr>
				<tr>
					<td align="right">
						<b>Pochodna</b>
					</td> 
					<td>
						<select name="pochodna" style="width: 121px">
							<option <%=licz.getPochodna().equals("wszystkie")?"selected=selected":"" %>>wszystkie</option>
							<option <%=licz.getPochodna().equals("pierwsza")?"selected=selected":"" %>>pierwsza</option>
							<option <%=licz.getPochodna().equals("druga")?"selected=selected":"" %>>druga</option>					
						</select>
					</td>
				</tr>
				<tr>
					<td align="right">
						<b>Iloraz</b>
					</td> 
					<td>
						<select name="iloraz" style="width: 121px">
							<option <%=licz.getIloraz().equals("wszystkie")?"selected=selected":"" %>>wszystkie</option>
							<option <%=licz.getIloraz().equals("wsteczny")?"selected=selected":"" %>>wsteczny</option>
							<option <%=licz.getIloraz().equals("centralny")?"selected=selected":"" %>>centralny</option>
							<option <%=licz.getIloraz().equals("do przodu")?"selected=selected":"" %>>do przodu</option>
						</select>
					</td>
				</tr>
				<tr><td></td><td align="right"><input type="button" value="Wyczyść" onclick="javascript:document.getElementById('wyr1').value='';"> <input type="submit" size="10" value="Oblicz">
				</td></tr>
			</table>
			</form>
			<br><br>
			<%if (licz.getWyr()!=null && licz.getX()!=null && licz.getH()!=null) {%>
			<table align="center">
				<tr>
					<td align="right">
						<b>&nbsp;Funkcja <var>x</var></b>
					</td>
					<td>
						<input value="<%=licz.getWyr() %>" size="50" readonly="readonly">  
					</td>
				</tr>
				<tr>
					<td align="right">
						<b><var>x<sub>0</sub></var></b> 	
					</td>
					<td>
						<input value="<%=licz.getX() %>" size="15" readonly="readonly">
					</td>
				</tr>
				<tr>
					<td align="right">
						<b><var>h</var></b>
					</td>
					<td>
						<input value="<%=licz.getH() %>" size="15" readonly="readonly">
					</td>
				</tr>	
				<%if(licz.getPochodna().equals("pierwsza") || licz.getPochodna().equals("wszystkie")){ %>
				<tr><td colspan="2">&nbsp; </td></tr>
				<tr>
					<td colspan="2">
						<b>&nbsp; pierwsza pochodna</b>
					</td>
				</tr>
				<%if(licz.getIloraz().equals("wsteczny") || licz.getIloraz().equals("wszystkie")){ %>
				<tr>
					<td align="right">
						 wsteczny
					</td>
					<td>
						<input value="<%=new BigDecimal( p.derivBack(licz.getWyr(), Double.parseDouble(licz.getX()), Double.parseDouble(licz.getH()),1)  ).setScale( 3, BigDecimal.ROUND_HALF_UP).doubleValue() %>" size="15" readonly="readonly"><br>
					</td>
				</tr>
				<%} %>
				<%if(licz.getIloraz().equals("do przodu") || licz.getIloraz().equals("wszystkie")){ %>
				<tr>
					<td align="right">
						 do przodu
					</td>
					<td>
						<input value="<%=new BigDecimal( p.derivForward(licz.getWyr(), Double.parseDouble(licz.getX()), Double.parseDouble(licz.getH()),1)  ).setScale( 3, BigDecimal.ROUND_HALF_UP).doubleValue() %>" size="15" readonly="readonly"><br>
					</td>
				</tr>
				<%} %>
				<%if(licz.getIloraz().equals("centralny") || licz.getIloraz().equals("wszystkie")){ %>
				<tr>
					<td align="right">
						 centralny
					</td>
					<td>
						<input value="<%=new BigDecimal( p.derivCentral(licz.getWyr(), Double.parseDouble(licz.getX()), Double.parseDouble(licz.getH()),1)  ).setScale( 3, BigDecimal.ROUND_HALF_UP).doubleValue() %>" size="15" readonly="readonly"><br>
					</td>
				</tr>
				<%} %>
				<%} %>
				<%if(licz.getPochodna().equals("druga") || licz.getPochodna().equals("wszystkie")){ %>
				<tr><td colspan="2">&nbsp; </td></tr>
				<tr>
					<td colspan="2">
						<b>&nbsp; druga pochodna</b>
					</td>
				</tr>
				<%if(licz.getIloraz().equals("wsteczny") || licz.getIloraz().equals("wszystkie")){ %>
				<tr>
					<td align="right">
						 wsteczny
					</td>
					<td>
						<input value="<%=new BigDecimal( p.derivBack(licz.getWyr(), Double.parseDouble(licz.getX()), Double.parseDouble(licz.getH()),2)  ).setScale( 3, BigDecimal.ROUND_HALF_UP).doubleValue() %>" size="15" readonly="readonly"><br>
					</td>
				</tr>
				<%} %>
				<%if(licz.getIloraz().equals("do przodu") || licz.getIloraz().equals("wszystkie")){ %>
				<tr>
					<td align="right">
						 do przodu
					</td>
					<td>
						<input value="<%=new BigDecimal( p.derivForward(licz.getWyr(), Double.parseDouble(licz.getX()), Double.parseDouble(licz.getH()),2)  ).setScale( 3, BigDecimal.ROUND_HALF_UP).doubleValue() %>" size="15" readonly="readonly"><br>
					</td>
				</tr>
				<%} %>
				<%if(licz.getIloraz().equals("centralny") || licz.getIloraz().equals("wszystkie")){ %>
				<tr>
					<td align="right">
						 centralny
					</td>
					<td>
						<input value="<%=new BigDecimal( p.derivCentral(licz.getWyr(), Double.parseDouble(licz.getX()), Double.parseDouble(licz.getH()),2)  ).setScale( 3, BigDecimal.ROUND_HALF_UP).doubleValue() %>" size="15" readonly="readonly"><br>
					</td>
				</tr>
				<%} %>
				<%} %>
			</table>
			<%} %>
			<br><br>
			
			<table align="center"><tr><td><img src=imageMaker1?></td></tr></table>
		</div>
		
		<div id="footer">
			<center><p>  2008 Created by Wojciech Żaboklicki </p></center>
		</div>
	</div>
</div>
</body>
</html>