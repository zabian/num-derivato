<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script type="text/javascript">
	function show(id){
		document.getElementById(id).style.visibility='visible'
	}
	function hide(id){
		document.getElementById(id).style.visibility='hidden'
	}

</script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="style.css" rel="stylesheet" type="text/css">
<title>derivato - Badanie dokładności</title>
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
			<span class="naglowek">Badanie dokładności różniczkowania</span><br><br> 
			<form method="post" action="show_experiment.jsp">
			<table bgcolor="gray">
				<tr>
					<td align="right">
						<b>Funkcja <var>x</var></b> 
					</td>
					<td>
						<input type="text" name="wyr" title="Np. (cos(x)^2)*x^3" size="50">
					</td>
				</tr>
				<tr id="poch">
					<td align="right">
						<b>I pochodna</b>
					</td>
					<td>
						<input type="text" name="wzorPoch" title="Wzór pochodnej obliczonej analitycznie, np. 2*x^2" size="50">
					</td>
				</tr>
				<tr id="poch2">
					<td align="right">
						<b>II pochodna</b>
					</td>
					<td>
						<input type="text" name="wzorPoch2" title="Wzór drugiej pochodnej obliczonej analitycznie, np. 4*x" size="50">
						
					</td>
				</tr>
				<tr>
					<td align="right">
						<b><var>x<sub>0</sub></var></b>
					</td>
					<td>
						<input type="text" name="x" title="Punkt różniczkowania, np. 3.453" size="15" >
					</td>
				</tr>
				<tr>
					<td align="right">
						<b>Iloraz</b>
					</td> 
					<td>
						<select name="iloraz" style="width: 108px" title="Iloraz różnicowy" ">
							<option>wsteczny</option>
							<option>centralny</option>
							<option>do przodu</option>
							<option>wszystkie</option>
						</select>
					</td>
				</tr>
				<tr>
					<td align="right">
						<b>Pochodna</b>
					</td>
					<td>
						<select name="pochodna" style="width: 108px" title="Stopień pochodnej"  >
							<option onclick="javascript:show('poch');hide('poch2');">pierwsza</option>
							<option onclick="javascript:show('poch2');hide('poch');">druga</option>
							<option selected="selected" onclick="javascript:show('poch');show('poch2');">wszystkie</option>							
						</select>
					</td>
				</tr>
				<tr><td></td><td align="right"><input type="reset" value="Wyczyść"> <input type="submit" size="10"  value="Oblicz">
				</td></tr>
			</table>
			</form>
		</div>
	</div>
	<div id="footer">
		<center><p> Created by Wojciech Żaboklicki </p></center>
	</div>
	
</div>


</body>
</html>