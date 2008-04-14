<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.ArrayList"%>
<%@page import="logic.Punkt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<%ArrayList<Punkt> ob=new ArrayList<Punkt>();
%>

</head>
<body>
<jsp:useBean id="points" class="web.PointsBean" scope="session"/>
<jsp:setProperty name="points" property="*"/>
<%
for (int i=0; i<points.getX().length; i++){
	Punkt p=new Punkt();
	p.setX(points.getX()[i]);
	p.setY(points.getY()[i]);
	ob.add(p);
}
%><%=ob.get(0).getX()%><%
request.getSession().setAttribute("ob",ob);
response.sendRedirect("show_data.jsp"); %>
</body>
</html>