<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	int user_uSeqno = Integer.parseInt(request.getParameter("user_uSeqno"));
    int questions_qSeqno = Integer.parseInt(request.getParameter("questions_qSeqno"));

	String url_mysql = "jdbc:mysql://localhost/wooboo?serverTimezone=UTC&characterEncoding=utf8&useSSL=FALSE";
	String id_mysql = "root";
	String pw_mysql = "qwer1234";

	PreparedStatement ps = null;
	try{
	    Class.forName("com.mysql.cj.jdbc.Driver");
	    Connection conn_mysql = DriverManager.getConnection(url_mysql,id_mysql,pw_mysql);
	    Statement stmt_mysql = conn_mysql.createStatement();
	
	    String A = "Delete FROM wooboo.like WHERE user_uSeqno = " + user_uSeqno + " and questions_qSeqno = " + questions_qSeqno;
	
	
	
	    ps = conn_mysql.prepareStatement(A);

	    ps.executeUpdate();
	
	    conn_mysql.close();
	} 
	
	catch (Exception e){

	    e.printStackTrace();
    }
    
%>