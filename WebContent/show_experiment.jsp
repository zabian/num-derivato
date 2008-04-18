<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="oblicz.Pochodna"%>
<%@page import="java.math.BigDecimal"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="style.css" rel="stylesheet" type="text/css">
<title>derivato - Wynik badania dokładności</title>
</head>
<body>
<%double[] h={0.1,0.01,0.001,0.0001,0.00001,0.000001,0.0000001,0.00000001};
Pochodna parser=new Pochodna();
double p;
%>
<jsp:useBean id="badanie" class="web.BadanieBean" scope="session"/>
<jsp:setProperty name="badanie" property="*"/>
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
			<span class="naglowek">Wynik badania dokładności</span><br><br> 
			<%System.out.println("++++++++:"+ badanie.getIloraz()); %>
			
			<%if(badanie.getPochodna().equals("pierwsza") || badanie.getPochodna().equals("wszystkie")){ %>
			<%double p1=parser.getValue(badanie.getWzorPoch(), Double.parseDouble(badanie.getX())); %>
			<div id="lewy" style="<%=badanie.getPochodna().equals("pierwsza")?"float:none;":"float:left;" %><%=badanie.getPochodna().equals("wszystkie")?"border-right:2px solid #000000":"" %>" >
					<span class="naglowek">Pierwsza pochodna</span><br><br>
					<%if (badanie.getIloraz().equals("wsteczny") || badanie.getIloraz().equals("wszystkie")){ %>
						
						<table>
							<tr>
								<td>
									<b><var>h</var></b>	
								</td>
								<td colspan="2" align="center">
									<b>wsteczny</b>
								</td>
							</tr>
							<%for (int i=0; i<h.length; i++) { %>
								<tr>
									<td>
										<%=h[i] %>
									</td>
									<td>
										<%p=new BigDecimal(parser.derivBack(badanie.getWyr(),Double.parseDouble(badanie.getX()),h[i],1)).setScale(4,BigDecimal.ROUND_HALF_UP).doubleValue(); %>
										<input value="<%=p %>" size="15" readonly="readonly">
									</td>
									<td>
										<input value="<%=Math.abs(p1-p) %>" size="15" readonly="readonly">
									</td>														
								</tr>
							<%}%>
						</table>
						<br><br>
					<%} %>
					
					<%if (badanie.getIloraz().equals("centralny") || badanie.getIloraz().equals("wszystkie")){ %>
						<table>
							<tr>
								<td>
									<b><var>h</var></b>	
								</td>
								<td colspan="2" align="center">
									<b>centralny</b>
								</td>
							</tr>
							<%for (int i=0; i<h.length; i++) { %>
								<tr>
									<td>
										<%=h[i] %>
									</td>
									<td>
										<%p=new BigDecimal(parser.derivCentral(badanie.getWyr(),Double.parseDouble(badanie.getX()),h[i],1)).setScale(4,BigDecimal.ROUND_HALF_UP).doubleValue(); %>
										<input value="<%=p %>" size="15" readonly="readonly">
									</td>
									<td>
										<input value="<%=Math.abs(p1-p) %>" size="15" readonly="readonly">
									</td>														
								</tr>
							<%}%>
						</table>
						<br><br>
					<%} %>
					
					<%if (badanie.getIloraz().equals("do przodu") || badanie.getIloraz().equals("wszystkie")){ %>
						<table>
							<tr>
								<td>
									<b><var>h</var></b>	
								</td>
								<td colspan="2" align="center">
									<b>do przodu</b>
								</td>
							</tr>
							<%for (int i=0; i<h.length; i++) { %>
								<tr>
									<td>
										<%=h[i] %>
									</td>
									<td>
										<%p=new BigDecimal(parser.derivForward(badanie.getWyr(),Double.parseDouble(badanie.getX()),h[i],1)).setScale(4,BigDecimal.ROUND_HALF_UP).doubleValue(); %>
										<input value="<%=p %>" size="15" readonly="readonly">
									</td>
									<td>
										<input value="<%=Math.abs(p1-p) %>" size="15" readonly="readonly">
									</td>														
								</tr>
							<%}%>
						</table>
						<br><br>
					<%} %>
			</div>
			<%} %>
			
			<%if(badanie.getPochodna().equals("druga") || badanie.getPochodna().equals("wszystkie")){ %>
			<%double p2=parser.getValue(badanie.getWzorPoch2(), Double.parseDouble(badanie.getX())); %>
			<div id="prawy" style="<%=badanie.getPochodna().equals("wszystkie")?"padding-left:320px":"" %>">
					<span class="naglowek">Druga pochodna</span><br><br>&#x0009;
					<%if (badanie.getIloraz().equals("wsteczny") || badanie.getIloraz().equals("wszystkie")){ %>
						
						<table>
							<tr>
								<td>
									<b><var>h</var></b>	
								</td>
								<td colspan="2" align="center">
									<b>wsteczny</b>
								</td>
							</tr>
							<%for (int i=0; i<h.length; i++) { %>
								<tr>
									<td>
										<%=h[i] %>
									</td>
									<td>
										<%p=new BigDecimal(parser.derivBack(badanie.getWyr(),Double.parseDouble(badanie.getX()),h[i],2)).setScale(4,BigDecimal.ROUND_HALF_UP).doubleValue(); %>
										<input value="<%=p %>" size="15" readonly="readonly">
									</td>
									<td>
										<input value="<%=Math.abs(p2-p) %>" size="15" readonly="readonly">
									</td>														
								</tr>
							<%}%>
						</table>
						<br><br>
					<%} %>
					
					<%if (badanie.getIloraz().equals("centralny") || badanie.getIloraz().equals("wszystkie")){ %>
						<table>
							<tr>
								<td>
									<b><var>h</var></b>	
								</td>
								<td colspan="2" align="center">
									<b>centralny</b>
								</td>
							</tr>
							<%for (int i=0; i<h.length; i++) { %>
								<tr>
									<td>
										<%=h[i] %>
									</td>
									<td>
										<%p=new BigDecimal(parser.derivCentral(badanie.getWyr(),Double.parseDouble(badanie.getX()),h[i],2)).setScale(4,BigDecimal.ROUND_HALF_UP).doubleValue(); %>
										<input value="<%=p %>" size="15" readonly="readonly">
									</td>
									<td>
										<input value="<%=Math.abs(p2-p) %>" size="15" readonly="readonly">
									</td>														
								</tr>
							<%}%>
						</table>
						<br><br>
					<%} %>
					
					<%if (badanie.getIloraz().equals("do przodu") || badanie.getIloraz().equals("wszystkie")){ %>
						<table>
							<tr>
								<td>
									<b><var>h</var></b>	
								</td>
								<td colspan="2" align="center">
									<b>do przodu</b>
								</td>
							</tr>
							<%for (int i=0; i<h.length; i++) { %>
								<tr>
									<td>
										<%=h[i] %>
									</td>
									<td>
										<%p=new BigDecimal(parser.derivForward(badanie.getWyr(),Double.parseDouble(badanie.getX()),h[i],2)).setScale(4,BigDecimal.ROUND_HALF_UP).doubleValue(); %>
										<input value="<%=p %>" size="15" readonly="readonly">
									</td>
									<td>
										<input value="<%=Math.abs(p2-p) %>" size="15" readonly="readonly">
									</td>														
								</tr>
							<%}%>
						</table>
						<br><br>
					<%} %>
					
			</div>
			
			<%} %>
			
			
			
			
		</div>
	</div>
	<div id="footer">
		<center><p> Created by Wojciech Żaboklicki </p></center>
	</div>
</div>

</body>
</html>