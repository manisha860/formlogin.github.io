
<html>
<%@ page import="java.sql.*,java.io.*" %>
<%!
	Connection conn;
	Statement stmt;
	ResultSet rs;
	String Marathi,Hindi,English,xyz,Username,Name;
%>
<head>
<style>
	body{
			font-family:Arial, sans-serif;
				margin:60px;
				padding:20px;
				background-color:#FFECEC;
			}
			
			</style>
</head>
<BODY bgcolor="#FFD0D0">
<div class="container">
<br><br>
<center><h1>RESULT</h1></center>
<hr>
<br><br><br><br><br>
<TABLE align="center" border=1 width=400>
<TR style="background:cyan;">
	<TH>Name</TH>
	<TH>Marathi</TH>
	<TH>Hindi</TH>
	<TH>English</TH>
	<TH>xyz</TH>
	
</TR>
<%
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/giiava","root","hema@0211");
		stmt=conn.createStatement();
		Username=request.getParameter("Username");
		
		rs=stmt.executeQuery("select register.Name, result.Marathi,result.Hindi,result.English,result.xyz from register Inner join result on register.Username=result.Username where result.Username='"+Username+"';");
		
		while(rs.next())
		{
			Name=rs.getString("Name");
			Marathi=rs.getString("Marathi");
			Hindi=rs.getString("Hindi");
			English=rs.getString("English");
			xyz=rs.getString("xyz");
			
			
%>
<TR>
	<TD><%=Name%></TD>
	<TD><%=Marathi%></TD>
	<TD><%=Hindi%></TD>
	<TD><%=English%></TD>
	<TD><%=xyz%></TD>
	
</TR>
<%
		}
		conn.close();
	}
	catch(ClassNotFoundException e)
	{
		out.println(e);
	}
	catch(SQLException e)
	{
		out.println(e);
	}
%>
</TABLE>
</BODY>
</HTML>