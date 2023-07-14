<%@page import="java.sql.*,java.io.*"%>

<body >
<%
	String Name,Cls,Username,Password,Create_Password;
	Name=request.getParameter("Name");
	Cls=request.getParameter("Cls");
	Username=request.getParameter("Username");
	Password=request.getParameter("Password");
	Create_Password=request.getParameter("Create_Password");

	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/giiava","root","hema@0211");
		Statement stmt=conn.createStatement();
		int i=stmt.executeUpdate("insert into register(Name,Cls,Username,Password)values('"+Name+"','"+Cls+"','"+Username+"','"+Password+"')");
		
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
</body>