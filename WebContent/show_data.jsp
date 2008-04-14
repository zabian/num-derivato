<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.util.ArrayList"%>
<%@page import="logic.Punkt"%>
<%@page import="org.apache.commons.fileupload.*"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.util.Streams"%>

<%@page import="java.io.InputStreamReader"%>
<%@page import="java.util.StringTokenizer"%>
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
				<a href="index.html">Start</a>
			</li>
			<li>	
				<a href="licz.jsp">Ze wzoru</a>
			</li>
			<li>
				<a href="index2.html">Dyskretnie</a>
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
			
			<table width="120">
				<tr align="center">
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
						<input type="text" readonly="readonly" value="<%=ob.get(i).getX() %>" size="15">
					</td>
					<td>
						<input type="text" readonly="readonly" value="<%=ob.get(i).getY() %>" size="15">
					</td>
				</tr>
				<%} %>
			</table>
			
			<%
			t=new double[ob.size()][ob.size()];
			for (int i=0;i<ob.size();i++){
				t[i][0]=ob.get(i).getY();
			}
			t[ob.size()-1][ob.size()-1]=fun(ob.size()-1,ob.size()-1);
			%>
			
			<br><br>
			<table width="320">
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
			Wielomian interpolacyjny Newtona ma wzór: <br>
			<var>w</var>(<var>x</var>)= <%
			for (int i=0; i<ob.size(); i++){%>
				<%=t[i][i]%>
				<%
				for(int j=0; j<i; j++){
					%>(<var>x</var>
					<%if(ob.get(j).getX()>0) {
						%>-<%=ob.get(j).getX()%><%
					}
					else%>+<%=(-1)*ob.get(j).getX()%>)<%
				}
				if (i<ob.size()-1 && t[i+1][i+1]>0){%>
					+<%
				}
			}
			double[] k=new double[ob.size()];
			for (int i=0; i<ob.size(); i++){
				k[i]=t[i][i];
			}
			Newton in= new Newton();%>
			<br><br>
			<%=in.getFormula(ob,k) %>
			<br><br>
			<%=in.horner(-1,ob,k,0) %>
			<br><br>
			<%=in.getFoo(ob,k) %>
			<br><br>
			<%=in.getHTMLClasic(ob,k) %>
			<% request.getSession().setAttribute("punkty",ob); %>
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
			
			<br><br>
			<table align="center"><tr><td><img src="imageMaker?" align="middle"></td></tr></table>

		</div>
	</div>
	<div id="footer">
		<center><p> Created by Wojciech Żaboklicki </p></center>
	</div>
</div>

</body>
</html>