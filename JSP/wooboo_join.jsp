<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>        
<%
	request.setCharacterEncoding("utf-8");
	String userid = request.getParameter("uEmail");
	String userpw = request.getParameter("uPw");
		
//------
	String url_mysql = "jdbc:mysql://localhost/wooboo?serverTimezone=Asia/Seoul&characterEncoding=utf8&useSSL=false";
	String id_mysql = "root";
	String pw_mysql = "qwer1234";

	int result2 = 0; // 입력 확인 

	PreparedStatement ps = null;
	try{
	    Class.forName("com.mysql.jdbc.Driver");
	    Connection conn_mysql = DriverManager.getConnection(url_mysql,id_mysql,pw_mysql);
		Statement stmt_mysql = conn_mysql.createStatement();
	
	    String A = "insert into user (uEmail, uPw, uInsertDate";
	    String B = ") values (?,?,now())";
	
	    ps = conn_mysql.prepareStatement(A+B);
	    ps.setString(1, userid);
	    ps.setString(2, userpw);
	    
		result2 = ps.executeUpdate();
%>
		{
			"result2" : "<%=result2%>"
		}

<%		
	    conn_mysql.close();
	} 
	catch (Exception e){
%>
		{
			"result2" : "<%=result2%>"
		}
<%		
	    e.printStackTrace();
	} 
	
%>

