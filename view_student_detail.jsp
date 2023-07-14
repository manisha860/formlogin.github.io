
<html>
<%@ page import="java.sql.*,java.io.*" %>
<%!
	Connection conn;
	Statement stmt;
	ResultSet rs;
	String Name,Cls,Username,Password;
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
<BODY >
<h2><center>STUDENT REGISTRATION DETAILS<center></h2><hr><br><br>
<TABLE align="center" border=1 width=400>
<TR style="background:cyan;">
	<TH>Name</TH>
	<TH>Cls</TH>
	<TH>Username</TH>
	<TH>Password</TH>
	
</TR>
<%
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/giiava","root","hema@0211");
		stmt=conn.createStatement();
		
		rs=stmt.executeQuery("select * from register");
		while(rs.next())
		{
			Name=rs.getString("Name");
			Cls=rs.getString("Cls");
			Username=rs.getString("Username");
			Password=rs.getString("Password");
		
%>
<TR>
	<TD><%=Name%></TD>
	<TD><%=Cls%></TD>
	<TD><%=Username%></TD>
	<TD><%=Password%></TD>
	
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