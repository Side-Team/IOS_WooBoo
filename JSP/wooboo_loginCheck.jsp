<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>        
<%
	request.setCharacterEncoding("utf-8");
	String uEmail = request.getParameter("uEmail");
	String uPw = request.getParameter("uPw");
		
//------
	String url_mysql = "jdbc:mysql://localhost/wooboo?serverTimezone=Asia/Seoul&characterEncoding=utf8&useSSL=false";
	String id_mysql = "root";
	String pw_mysql = "qwer1234";
	String WhereDefault = "select count(uEmail) from user where uEmail ='" + uEmail + "' && uPw = '" + uPw + "'";

	int count =0;
	int result = 0; 

	PreparedStatement ps = null;
	try{
	    Class.forName("com.mysql.jdbc.Driver");
	    Connection conn_mysql = DriverManager.getConnection(url_mysql,id_mysql,pw_mysql);
		Statement stmt_mysql = conn_mysql.createStatement();
	
		ResultSet rs = stmt_mysql.executeQuery(WhereDefault); 
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
            "result" : "<%=rs.getInt(1)%>"
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
		