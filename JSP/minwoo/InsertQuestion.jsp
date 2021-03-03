<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	int user_uSeqno = Integer.parseInt(request.getParameter("user_uSeqno"));
    String qTitle = request.getParameter("qTitle");
    String qSelection1 = request.getParameter("qSelection1");
    String qSelection2 = request.getParameter("qSelection2");
    String qSelection3 = request.getParameter("qSelection3");
    String qSelection4 = request.getParameter("qSelection4");
    String qSelection5 = request.getParameter("qSelection5");
    int qCategory = Integer.parseInt(request.getParameter("qCategory"));
    String qImageFileName1 = request.getParameter("qImageFileName1");
    String qImageFileName2 = request.getParameter("qImageFileName2");
    String qImageFileName3 = request.getParameter("qImageFileName3");
    String qImageFileName4 = request.getParameter("qImageFileName4");
    String qImageFileName5 = request.getParameter("qImageFileName5");

	String url_mysql = "jdbc:mysql://aws-wooboo.ccsntmql93pq.ap-northeast-2.rds.amazonaws.com/wooboo?serverTimezone=UTC&characterEncoding=utf8&useSSL=FALSE";
	String id_mysql = "wooboo";
	String pw_mysql = "qwer1234";

	PreparedStatement ps = null;
	try{
	    Class.forName("com.mysql.cj.jdbc.Driver");
	    Connection conn_mysql = DriverManager.getConnection(url_mysql,id_mysql,pw_mysql);
	    Statement stmt_mysql = conn_mysql.createStatement();
	
	    String A = "INSERT INTO wooboo.questions (user_uSeqno, qTitle, qSelection1, qSelection2, qSelection3, qSelection4, qSelection5, qCategory, qImageFileName1, qImageFileName2, qImageFileName3, qImageFileName4, qImageFileName5) ";
	    String B = "VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)";
	
	
	
	    ps = conn_mysql.prepareStatement(A+B);
		ps.setInt(1, user_uSeqno);
	    ps.setString(2, qTitle);
        ps.setString(3, qSelection1);
	    ps.setString(4, qSelection2);
	    ps.setString(5, qSelection3);
	    ps.setString(6, qSelection4);
	    ps.setString(7, qSelection5);
	    ps.setInt(8, qCategory);
	    ps.setString(9, qImageFileName1);
	    ps.setString(10, qImageFileName2);
	    ps.setString(11, qImageFileName3);
	    ps.setString(12, qImageFileName4);
	    ps.setString(13, qImageFileName5);

	    ps.executeUpdate();
	
	    conn_mysql.close();
	} 
	
	catch (Exception e){

	    e.printStackTrace();
    }
    
%>