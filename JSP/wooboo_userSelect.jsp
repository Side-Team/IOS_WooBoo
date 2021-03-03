<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%

    String uEmail = request.getParameter("uEmail");


	String url_mysql = "jdbc:mysql://aws-wooboo.ccsntmql93pq.ap-northeast-2.rds.amazonaws.com/wooboo?serverTimezone=UTC&characterEncoding=utf8&useSSL=FALSE";
 	String id_mysql = "wooboo";
 	String pw_mysql = "qwer1234";
    String WhereDefault = "select uSeqno, uEmail, uPw, uImageFileName, uLogin from user where uEmail ='" + uEmail + "'" ;
    int count = 0;
    
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn_mysql = DriverManager.getConnection(url_mysql, id_mysql, pw_mysql);
        Statement stmt_mysql = conn_mysql.createStatement();

        ResultSet rs = stmt_mysql.executeQuery(WhereDefault); // &quot;
%>
  	[ 
<%
        while (rs.next()) {
            if (count == 0) {

            }else{
%>
            , 
<%           
            }
            count++;                 
%>
			{
			"seqno" : "<%=rs.getInt(1) %>",
			"email" : "<%=rs.getString(2) %>",
			"pw" : "<%=rs.getString(3) %>", 
			"Image" : "<%=rs.getString(4) %>",
            "login"	: "<%=rs.getString(5) %>"		
			}
<%		
        }
%>
		  ]
<%		
        conn_mysql.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
	
%>
