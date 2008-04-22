<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.ArrayList"%>
<%@page import="logic.Punkt"%>
<%@page import="logic.Newton"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="style.css" rel="stylesheet" type="text/css">
<title>derivato - Prezentacja danych</title>
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
			<span class="naglowek">Prezentacja danych</span><br><br>
			<%!
			double[][] t;
			ArrayList<Punkt> ob;
			public double fun(int i,int j){
				if (j==0){
					return t[i][j];
				}
				else{
					t[i][j]=(fun(i,j-1)-fun(i-1,j-1))/(ob.get(i).getX()-ob.get(i-j).getX());
					return t[i][j];
				}
					
			}
			%>
			<%
			ob=new ArrayList<Punkt>();
			ob=(ArrayList<Punkt>)request.getSession().getAttribute("ob");
			
			
			
			%>
			
			<table>
				<tr align="center" style="border-bottom: 2px solid">
					<td>
						<b><var>i</var></b> &nbsp;
					</td>
					<td>
						<b><var>x<sub>i</sub></var></b>
					</td>
					<td>
						<b><var>y<sub>i</sub></var></b>
					</td>
				</tr>
				<%for(int i=0; i<ob.size();i++){%>
				<tr align="center">
					<td>
						<b><%=i %></b>&nbsp;
					</td>
					<td>
						<input type="text" readonly="readonly" value="<%=ob.get(i).getX() %>" title="x<%=i %>" size="15">
					</td>
					<td>
						<input type="text" readonly="readonly" value="<%=ob.get(i).getY() %>" title="y<%=i %>" size="15">
					</td>
				</tr>
				<%} %>
			</table>
			<br><a href="punkty.csv">punkty.csv</a>
			<%
			t=new double[ob.size()][ob.size()];
			for (int i=0;i<ob.size();i++){
				t[i][0]=ob.get(i).getY();
			}
			t[ob.size()-1][ob.size()-1]=fun(ob.size()-1,ob.size()-1);
			%>
			
			<br><br>
			<table width="200">
			<%for(int i=0; i<ob.size(); i++ ){%>
			<tr>
				<%for(int j=0; j<ob.size(); j++){ %>
				<td>
					<%if (i==j){%><b>
					<%=t[i][j] %></b>
					<%}
					else{%><%=t[i][j] %>
					<%} %>
				</td><%
				}%>
			</tr><%
			}%>
			</table>
			<br><br>
			<span class="naglowek">Wielomian interpolacyjny Newtona ma wzór:</span> <br>
			<b><var>w</var>(<var>x</var>)</b>= <%
			double[] k=new double[ob.size()];
			for (int i=0; i<ob.size(); i++){
				k[i]=t[i][i];
			}
			Newton in= new Newton(ob);%>
			<%=in.getFormula() %> &nbsp;&nbsp;<a href="newton_deriv.jsp">pochodna</a>
								  &nbsp;&nbsp;<a href="#" onclick="javascript:document.getElementById('roznice').style.visibility='visible'">ekstrapolacja</a>
			<br><br>
			<%=in.horner(3,0) %>
			<br><br>
			<%=in.getFoo(ob,k) %>
			<br><br>
			<%=in.getHTMLClasic(ob,k) %>
			<div id="roznice" style="visibility: hidden">
			<table width="200">
				<%for(int i=0; i<ob.size(); i++ ){%>
				<tr>
					<%for(int j=0; j<ob.size(); j++){ %>
					<td>
						<%if (i==j){%><b>
						<%=t[i][j] %></b>
						<%}
						else{%><%=t[i][j] %>
						<%} %>
					</td><%
					}%>
				</tr><%
			}%>
			</table>
			</div>
			<% request.getSession().setAttribute("punkty",ob); 
			   request.getSession().setAttribute("interpolacja",in);%>
			
			
			<%
					/*
					//PrintWriter pw = new PrintWriter(
					//new BufferedWriter(new FileWriter("Demo.out")));
					ServletInputStream in = request.getInputStream();
					
					int i = in.read();
					while (i != -1) {
					//pw.print((char) i);
					
					out.write(i);
					i = in.read();
					}*/
			//byte[] tab=request.getParameter("bbb").getBytes();
			%>
			
		</div>
	</div>
	<div id="footer">
		<center><p> Created by Wojciech Żaboklicki </p></center>
	</div>
</div>

</body>
</html>