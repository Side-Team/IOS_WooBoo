<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	int user_uSeqno = Integer.parseInt(request.getParameter("user_uSeqno"));
    int questions_qSeqno = Integer.parseInt(request.getParameter("questions_qSeqno"));
    String rContent = request.getParameter("rContent");

	String url_mysql = "jdbc:mysql://aws-wooboo.ccsntmql93pq.ap-northeast-2.rds.amazonaws.com/wooboo?serverTimezone=UTC&characterEncoding=utf8&useSSL=FALSE";
	String id_mysql = "wooboo";
	String pw_mysql = "qwer1234";

	PreparedStatement ps = null;
	try{
	    Class.forName("com.mysql.cj.jdbc.Driver");
	    Connection conn_mysql = DriverManager.getConnection(url_mysql,id_mysql,pw_mysql);
	    Statement stmt_mysql = conn_mysql.createStatement();
	
	    String A = "INSERT INTO wooboo.report VALUES(?, ?, ?, now(), 0) ";
	
	
	
	    ps = conn_mysql.prepareStatement(A);
		ps.setInt(1, questions_qSeqno);
		ps.setInt(2, user_uSeqno);
        ps.setString(3, rContent);

	    ps.executeUpdate();
	
	    conn_mysql.close();
	} 
	
	catch (Exception e){

	    e.printStackTrace();
    }
    
%>