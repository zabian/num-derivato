<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.ArrayList"%>
<%@page import="logic.Punkt"%>
<%@page import="logic.Newton"%>
<%@page import="web.NewtonBean"%>
<%@page import="logic.NewtonPochodna"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="images/math.gif" rel="SHORTCUT ICON">
<link href="style.css" rel="stylesheet" type="text/css">
<title>derivato - Wybór pliku z danymi</title>
</head>
<body>
<%ArrayList<Punkt> ob=(ArrayList<Punkt>) request.getSession().getAttribute("ob");
Newton in=(Newton) request.getSession().getAttribute("interpolacja");
NewtonPochodna n=new NewtonPochodna(in);%>
<jsp:useBean id="newton" class="web.NewtonBean" scope="page"/>
<jsp:setProperty name="newton" property="*"/>
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
		
		<br><hr align="left" style="background-color: #000000; width: 70%"><br>
		<%if (newton.getPochodna().equals("wszystkie") || newton.getPochodna().equals("pierwsza")){ %>
			<div id="lewy" style="<%=newton.getPochodna().equals("pierwsza")?"float:none;":"float:left;" %><%=newton.getPochodna().equals("wszystkie")?"border-right:2px solid #000000":"" %>" >
			<span class="naglowek">Pierwsza pochodna</span><br><br>
				<%if (newton.getX().equals("wszystkie")){ 
					for(int i=0; i<ob.size(); i++){ %>
						<table>
							<tr>
								<td align="right">
									<b><var>x<sub>0</sub> </var> </b>
								</td>
								<td>
									<input type="text" value="<%=ob.get(i).getX() %>" size="20">
								</td>
							</tr>
							<%if (newton.getIloraz().equals("wszystkie") || newton.getIloraz().equals("progresywny")){ %>
								<tr>
									<td>
										<b>progresywny</b>
									</td>
									<td>
										<input type="text" value="<%=n.derivForward(ob.get(i).getX(),Double.parseDouble(newton.getH()),1) %>" size="20">
									</td>
								</tr>
							<%} %>
							<%if (newton.getIloraz().equals("wszystkie") || newton.getIloraz().equals("wsteczny")){ %>
								<tr>
									<td align="right">
										<b>wsteczny</b>
									</td>
									<td>
										<input type="text" value="<%=n.derivBack(ob.get(i).getX(),Double.parseDouble(newton.getH()),1) %>" size="20">
									</td>
								</tr>
							<%} %>
							<%if (newton.getIloraz().equals("wszystkie") || newton.getIloraz().equals("centralny")){ %>
								<tr>
									<td align="right">
										<b>centralny</b>
									</td>
									<td>
										<input type="text" value="<%=n.derivCentral(ob.get(i).getX(),Double.parseDouble(newton.getH()),1) %>" size="20">
									</td>
								</tr>
							<%} %>
						</table><br><br>
					<%} %>	
				<%} else{ %>
						<table>
							<tr>
								<td align="right">
									<b><var>x<sub>0</sub> </var> </b>
								</td>
								<td>
									<input type="text" value="<%=Double.parseDouble(newton.getX()) %>" size="20">
								</td>
							</tr>
							<%if (newton.getIloraz().equals("wszystkie") || newton.getIloraz().equals("progresywny")){ %>
								<tr>
									<td align="right">
										<b>progresywny</b>
									</td>
									<td>
										<input type="text" value="<%=n.derivForward(Double.parseDouble(newton.getX()),Double.parseDouble(newton.getH()),1) %>" size="20">
									</td>
								</tr>
							<%} %>
							<%if (newton.getIloraz().equals("wszystkie") || newton.getIloraz().equals("wsteczny")){ %>
								<tr>
									<td align="right">
										<b>wsteczny</b>
									</td>
									<td>
										<input type="text" value="<%=n.derivBack(Double.parseDouble(newton.getX()),Double.parseDouble(newton.getH()),1) %>" size="20">
									</td>
								</tr>
							<%} %>
							<%if (newton.getIloraz().equals("wszystkie") || newton.getIloraz().equals("centralny")){ %>
								<tr>
									<td align="right">
										<b>centralny</b>
									</td>
									<td>
										<input type="text" value="<%=n.derivCentral(Double.parseDouble(newton.getX()),Double.parseDouble(newton.getH()),1) %>" size="20">
									</td>
								</tr>
							<%} %>
						</table><br>
						
				
					<%} %>
			</div>
		<%} %>
		
		<%if(newton.getPochodna().equals("druga") || newton.getPochodna().equals("wszystkie")){ %>
			<div id="lewy" style="<%=newton.getPochodna().equals("wszystkie")?"padding-left:100px":""%>" >
			<span class="naglowek">Druga pochodna</span><br><br>
				<%if (newton.getX().equals("wszystkie")){ 
					for(int i=0; i<ob.size(); i++){ %>
						<table>
							<tr>
								<td align="right">
									<b><var>x<sub>0</sub> </var> </b>
								</td>
								<td>
									<input type="text" value="<%=ob.get(i).getX() %>" size="20">
								</td>
							</tr>
							<%if (newton.getIloraz().equals("wszystkie") || newton.getIloraz().equals("progresywny")){ %>
								<tr>
									<td align="right">
										<b>progresywny</b>
									</td>
									<td>
										<input type="text" value="<%=n.derivForward(ob.get(i).getX(),Double.parseDouble(newton.getH()),2) %>" size="20">
									</td>
								</tr>
							<%} %>
							<%if (newton.getIloraz().equals("wszystkie") || newton.getIloraz().equals("wsteczny")){ %>
								<tr>
									<td align="right">
										<b>wsteczny</b>
									</td>
									<td>
										<input type="text" value="<%=n.derivBack(ob.get(i).getX(),Double.parseDouble(newton.getH()),2) %>" size="20">
									</td>
								</tr>
							<%} %>
							<%if (newton.getIloraz().equals("wszystkie") || newton.getIloraz().equals("centralny")){ %>
								<tr>
									<td align="right">
										<b>centralny</b>
									</td>
									<td>
										<input type="text" value="<%=n.derivCentral(ob.get(i).getX(),Double.parseDouble(newton.getH()),2) %>" size="20">
									</td>
								</tr>
							<%} %>
						</table><br><br>
					<%} %>	
				<%} else{ %>
						<table>
							<tr>
								<td align="right">
									<b><var>x<sub>0</sub> </var> </b>
								</td>
								<td>
									<input type="text" value="<%=Double.parseDouble(newton.getX()) %>" size="20">
								</td>
							</tr>
							<%if (newton.getIloraz().equals("wszystkie") || newton.getIloraz().equals("progresywny")){ %>
								<tr>
									<td align="right">
										<b>progresywny</b>
									</td>
									<td>
										<input type="text" value="<%=n.derivForward(Double.parseDouble(newton.getX()),Double.parseDouble(newton.getH()),2) %>" size="20">
									</td>
								</tr>
							<%} %>
							<%if (newton.getIloraz().equals("wszystkie") || newton.getIloraz().equals("wsteczny")){ %>
								<tr>
									<td align="right">
										<b>wsteczny</b>
									</td>
									<td>
										<input type="text" value="<%=n.derivBack(Double.parseDouble(newton.getX()),Double.parseDouble(newton.getH()),2) %>" size="20">
									</td>
								</tr>
							<%} %>
							<%if (newton.getIloraz().equals("wszystkie") || newton.getIloraz().equals("centralny")){ %>
								<tr>
									<td align="right">
										<b>centralny</b>
									</td>
									<td>
										<input type="text" value="<%=n.derivCentral(Double.parseDouble(newton.getX()),Double.parseDouble(newton.getH()),2) %>" size="20">
									</td>
								</tr>
							<%} %>
						</table><br>
						
				
					<%} %>
			
		<%} %>
		<br><br>
		</div>
		
	</div>
	<div id="footer">
		<center><p> Created by Wojciech Żaboklicki </p></center>
	</div>
	
</div>

</body>
</html>