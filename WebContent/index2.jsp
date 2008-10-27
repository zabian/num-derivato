<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="images/math.gif" rel="SHORTCUT ICON">
<link href="style.css" rel="stylesheet" type="text/css">
<title>derivato - Wybór pliku z danymi</title>
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
			<span class="naglowek">Wybór zestawu danych</span><br><br>
			
			<%if (request.getSession().getAttribute("ob")!=null){ %>
				<a href="show_data.jsp">Użyj wczytanych w sesji</a><br><br><%}%>
			<div id="lewy1">
				<span class="naglowek2">Wybór pliku z danymi</span><br><br> 
				<form action="wyswietl.jsp" method="post" enctype="multipart/form-data">
				<table align="center">
					<tr>
						<td>
							<input type="file" title="Ścieżka do pliku csv ze współrzędnymi funkcji" name="bbb" value="Przeglądaj"><br>
						</td>
					</tr>
				
					<tr>
						<td>
							<input type="submit" value="Prześlij">
						</td>
					</tr>
				</table>
				
				</form>
			</div><br>
			<div id="prawy1">
				<span class="naglowek2">Wprowadź współrzędne</span><br><br>
				<form action="wpisz.jsp" method="get">
					<table align="center">
						<tr>
							<td>
							<b>Liczba punktów</b>
							</td>
							<td>
								<input type="text" title="Liczba punktów do wprowadzenia" name="qty" size="15">
							</td>
						</tr>
						<tr>
							<td>
							</td>
							<td align="right">
								<input type="submit" value="Wprowadź">
							</td>
						</tr>
					</table>
				</form>
			</div>
			
		</div>
	</div>
	<div id="footer">
		<p>2008 - Created by Wojciech Żaboklicki </p>
	</div>
	
</div>

</body>
</html>