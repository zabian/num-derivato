<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="oblicz.Pochodna"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="logic.Rounder"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="images/math.gif" rel="SHORTCUT ICON">
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
			
			<table>
				<tr>
					<td align="right">
						<b>Funkcja <var>x</var></b>
					</td>
					<td>
						<input type="text" value="<%=badanie.getWyr() %>" size="50" readonly="readonly">
					</td>
				</tr>
				<%if (badanie.getPochodna().equals("pierwsza") || badanie.getPochodna().equals("wszystkie")){%>
				<tr>
					<td align="right">
						<b>I pochodna</b>
					</td>
					<td>
						<input type="text" value="<%=badanie.getWzorPoch() %>" size="50" readonly="readonly">
					</td>
				</tr>
				<%}%>
				<%if (badanie.getPochodna().equals("druga") || badanie.getPochodna().equals("wszystkie")){%>
				<tr>
					<td align="right">
						<b>II pochodna</b>
					</td>
					<td>
						<input type="text" value="<%=badanie.getWzorPoch2() %>" size="50" readonly="readonly">
					</td>
				</tr>
				<%}%>
				<tr>
					<td align="right">
						<b><var>x</var><sub>0</sub> </b>
					</td>
					<td>
						<input type="text" value="<%=badanie.getX() %>" size="15" readonly="readonly">
					</td>
				</tr>
			</table>
			<br>
			<hr align="left" style="background-color: #000000; width: 70%"><br>
			
			<%if(badanie.getPochodna().equals("pierwsza") || badanie.getPochodna().equals("wszystkie")){ %>
			<%double p1=Rounder.round(parser.getValue(badanie.getWzorPoch(), Double.parseDouble(badanie.getX())), Integer.parseInt(badanie.getPrecyzja())); %>
			<div id="lewy" style="<%=badanie.getPochodna().equals("pierwsza")?"float:none;":"float:left;" %><%=badanie.getPochodna().equals("wszystkie")?"border-right:2px solid #000000":"" %>" >
					<span class="naglowek">Pierwsza pochodna</span><br><br>
					<%if (badanie.getIloraz().equals("wsteczny") || badanie.getIloraz().equals("wszystkie")){ %>
						
						<table>
							<tr>
								<td rowspan="2" valign="bottom">
									<b><var>h</var></b>	
								</td>
								<td colspan="2" align="center">
									<b>wsteczny</b>
								</td>
							</tr>
							<tr>
								<td align="center">
									<b>f'(x)</b>
								</td>
								<td align="center">
									<b>|E(f'(x))|</b>
								</td>
							</tr>
							<%for (int i=0; i<h.length; i++) { %>
								<tr>
									<td>
										<%=h[i] %>
									</td>
									<td>
										<%p=Rounder.round(parser.derivBack(badanie.getWyr(),Double.parseDouble(badanie.getX()),h[i],1), Integer.parseInt(badanie.getPrecyzja())); %>
										<input value="<%=p %>" size="15" readonly="readonly">
									</td>
									<td>
										<input value="<%=Rounder.round(Math.abs(p1-p), Integer.parseInt(badanie.getPrecyzja()))  %>" size="15" readonly="readonly">
									</td>														
								</tr>
							<%}%>
						</table>
						<br><br>
					<%} %>
					
					<%if (badanie.getIloraz().equals("centralny") || badanie.getIloraz().equals("wszystkie")){ %>
						<table>
							<tr>
								<td rowspan="2" valign="bottom">
									<b><var>h</var></b>	
								</td>
								<td colspan="2" align="center">
									<b>centralny</b>
								</td>
							</tr>
							<tr>
								<td align="center">
									<b>f'(x)</b>
								</td>
								<td align="center">
									<b>|E(f'(x))|</b>
								</td>
							</tr>
							<%for (int i=0; i<h.length; i++) { %>
								<tr>
									<td>
										<%=h[i] %>
									</td>
									<td>
										<%p=Rounder.round(parser.derivCentral(badanie.getWyr(),Double.parseDouble(badanie.getX()),h[i],1), Integer.parseInt(badanie.getPrecyzja())); %>
										<input value="<%=p %>" size="15" readonly="readonly">
									</td>
									<td>
										<input value="<%=Rounder.round(Math.abs(p1-p), Integer.parseInt(badanie.getPrecyzja())) %>" size="15" readonly="readonly">
									</td>														
								</tr>
							<%}%>
						</table>
						<br><br>
					<%} %>
					
					<%if (badanie.getIloraz().equals("do przodu") || badanie.getIloraz().equals("wszystkie")){ %>
						<table>
							<tr>
								<td rowspan="2" valign="bottom">
									<b><var>h</var></b>	
								</td>
								<td colspan="2" align="center">
									<b>progresywny</b>
								</td>
							</tr>
							<tr>
								<td align="center">
									<b>f'(x)</b>
								</td>
								<td align="center">
									<b>|E(f'(x))|</b>
								</td>
							</tr>
							<%for (int i=0; i<h.length; i++) { %>
								<tr>
									<td>
										<%=h[i] %>
									</td>
									<td>
										<%p=Rounder.round(parser.derivForward(badanie.getWyr(),Double.parseDouble(badanie.getX()),h[i],1), Integer.parseInt(badanie.getPrecyzja())); %>
										<input value="<%=p %>" size="15" readonly="readonly">
									</td>
									<td>
										<input value="<%=Rounder.round(Math.abs(p1-p), Integer.parseInt(badanie.getPrecyzja())) %>" size="15" readonly="readonly">
									</td>														
								</tr>
							<%}%>
						</table>
						<br><br>
					<%} %>
			</div>
			<%} %>
			
			<%if(badanie.getPochodna().equals("druga") || badanie.getPochodna().equals("wszystkie")){ %>
			<%double p2=Rounder.round(parser.getValue(badanie.getWzorPoch2(), Double.parseDouble(badanie.getX())), Integer.parseInt(badanie.getPrecyzja())); %>
			<div id="prawy" style="<%=badanie.getPochodna().equals("wszystkie")?"padding-left:340px":"" %>">
					<span class="naglowek">Druga pochodna</span><br><br>&#x0009;
					<%if (badanie.getIloraz().equals("wsteczny") || badanie.getIloraz().equals("wszystkie")){ %>
						
						<table>
							<tr>
								<td rowspan="2" valign="bottom">
									<b><var>h</var></b>	
								</td>
								<td colspan="2" align="center">
									<b>wsteczny</b>
								</td>
							</tr>
							<tr>
								<td align="center">
									<b>f''(x)</b>
								</td>
								<td align="center">
									<b>|E(f''(x))|</b>
								</td>
							</tr>
							<%for (int i=0; i<h.length; i++) { %>
								<tr>
									<td>
										<%=h[i] %>
									</td>
									<td>
										<%p=Rounder.round(parser.derivBack(badanie.getWyr(),Double.parseDouble(badanie.getX()),h[i],2), Integer.parseInt(badanie.getPrecyzja())); %>
										<input value="<%=p %>" size="15" readonly="readonly">
									</td>
									<td>
										<input value="<%=Rounder.round(Math.abs(p2-p), Integer.parseInt(badanie.getPrecyzja())) %>" size="15" readonly="readonly">
									</td>														
								</tr>
							<%}%>
						</table>
						<br><br>
					<%} %>
					
					<%if (badanie.getIloraz().equals("centralny") || badanie.getIloraz().equals("wszystkie")){ %>
						<table>
							<tr>
								<td rowspan="2" valign="bottom">
									<b><var>h</var></b>	
								</td>
								<td colspan="2" align="center">
									<b>centralny</b>
								</td>
							</tr>
							<tr>
								<td align="center">
									<b>f''(x)</b>
								</td>
								<td align="center">
									<b>|E(f''(x))|</b>
								</td>
							</tr>
							<%for (int i=0; i<h.length; i++) { %>
								<tr>
									<td>
										<%=h[i] %>
									</td>
									<td>
										<%p=Rounder.round(parser.derivCentral(badanie.getWyr(),Double.parseDouble(badanie.getX()),h[i],2), Integer.parseInt(badanie.getPrecyzja())); %>
										<input value="<%=p %>" size="15" readonly="readonly">
									</td>
									<td>
										<input value="<%=Rounder.round(Math.abs(p2-p), Integer.parseInt(badanie.getPrecyzja())) %>" size="15" readonly="readonly">
									</td>														
								</tr>
							<%}%>
						</table>
						<br><br>
					<%} %>
					
					<%if (badanie.getIloraz().equals("do przodu") || badanie.getIloraz().equals("wszystkie")){ %>
						<table>
							<tr>
								<td rowspan="2" valign="bottom">
									<b><var>h</var></b>	
								</td>
								<td colspan="2" align="center">
									<b>progresywny</b>
								</td>
							</tr>
							<tr>
								<td align="center">
									<b>f''(x)</b>
								</td>
								<td align="center">
									<b>|E(f''(x))|</b>
								</td>
							</tr>
							<%for (int i=0; i<h.length; i++) { %>
								<tr>
									<td>
										<%=h[i] %>
									</td>
									<td>
										<%p=Rounder.round(parser.derivForward(badanie.getWyr(),Double.parseDouble(badanie.getX()),h[i],2), Integer.parseInt(badanie.getPrecyzja())); %>
										<input value="<%=p %>" size="15" readonly="readonly">
									</td>
									<td>
										<input value="<%=Rounder.round(Math.abs(p2-p), Integer.parseInt(badanie.getPrecyzja())) %>" size="15" readonly="readonly">
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
		<p>2008 - Created by Wojciech Żaboklicki </p>
	</div>
</div>

</body>
</html>