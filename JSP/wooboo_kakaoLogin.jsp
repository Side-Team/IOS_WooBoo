<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>        
<%
	request.setCharacterEncoding("utf-8");
	String userid = request.getParameter("uEmail");

//------
	String url_mysql = "jdbc:mysql://aws-wooboo.ccsntmql93pq.ap-northeast-2.rds.amazonaws.com/wooboo?serverTimezone=Asia/Seoul&characterEncoding=utf8&useSSL=false";
	String id_mysql = "wooboo";
	String pw_mysql = "qwer1234";

	int result2 = 0; // 입력 확인 

	PreparedStatement ps = null;
	try{
	    Class.forName("com.mysql.jdbc.Driver");
	    Connection conn_mysql = DriverManager.getConnection(url_mysql,id_mysql,pw_mysql);
		Statement stmt_mysql = conn_mysql.createStatement();
	
	    String A = "insert into user (uEmail, uInsertDate, uLogin";
	    String B = ") values (?,now(),'kakao')";
	
	    ps = conn_mysql.prepareStatement(A+B);
	    ps.setString(1, userid);
	    
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

