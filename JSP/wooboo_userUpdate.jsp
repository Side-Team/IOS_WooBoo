<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>        

<%
	request.setCharacterEncoding("utf-8");
	String uEmail = request.getParameter("uEmail");	
	String pw = request.getParameter("pw");
	String uImageFileName = request.getParameter("uImageFileName");

//------

	String url_mysql = "jdbc:mysql://localhost/wooboo?serverTimezone=UTC&characterEncoding=utf8&useSSL=FALSE";
	String id_mysql = "root";
	String pw_mysql = "qwer1234";

	PreparedStatement ps = null;

	try{
	    Class.forName("com.mysql.cj.jdbc.Driver");
	    Connection conn_mysql = DriverManager.getConnection(url_mysql,id_mysql,pw_mysql);
	    Statement stmt_mysql = conn_mysql.createStatement();
	
		String A = "update user set uPw = ?, uImageFileName = ? ";
		String B = "where uEmail = '" + uEmail + "'";


	    ps = conn_mysql.prepareStatement(A+B);

        ps.setString(1, pw);
	    ps.setString(2, uImageFileName);
	    
 
	    ps.executeUpdate();
	
	    conn_mysql.close();

	} 

	catch (Exception e){
	    e.printStackTrace();

	}

%>
