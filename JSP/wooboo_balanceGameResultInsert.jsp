<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>        
<%
	request.setCharacterEncoding("utf-8");
	String balancegame_bSeqno = request.getParameter("balancegame_bSeqno");
	String user_uSeqno = request.getParameter("user_uSeqno");
	String sbSelection = request.getParameter("sbSelection");
	
//------
	String url_mysql = "jdbc:mysql://localhost/wooboo?serverTimezone=UTC&characterEncoding=utf8&useSSL=FALSE";
	String id_mysql = "root";
	String pw_mysql = "qwer1234";

	PreparedStatement ps = null;
	try{
	    Class.forName("com.mysql.cj.jdbc.Driver");
	    Connection conn_mysql = DriverManager.getConnection(url_mysql,id_mysql,pw_mysql);
	    Statement stmt_mysql = conn_mysql.createStatement();
	
	    String A = "insert into select_balancegame(balancegame_bSeqno, user_uSeqno, sbSelection";
	    String B = ") values (?,?,?) ";
	
	    ps = conn_mysql.prepareStatement(A+B);
	    ps.setString(1, balancegame_bSeqno);
	    ps.setString(2, user_uSeqno);
	    ps.setString(3, sbSelection);
	    
	    
	    ps.executeUpdate();
	
	    conn_mysql.close();
	} 
	
	catch (Exception e){
	    e.printStackTrace();
	}

%>

